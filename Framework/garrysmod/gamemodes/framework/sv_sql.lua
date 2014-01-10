/*
[[----------------------------------------------]]
[[--  Framework SQL  ---------------------------]]
[[--  Server-side code for MySQL data storage.  ]]
[[----------------------------------------------]]
*/

//Implement MySQLOO functionality.
require("mysqloo");

DATABASE = mysqloo.connect(DATABASE_HOST, DATABASE_USER, DATABASE_PASS, DATABASE_NAME, DATABASE_PORT);
DATABASE:connect();

//A simple, re-useable function for checking
//database queries.
local function IsEmpty(data)
	if data[1] == nil then
		return true;
	else
		return false;
	end
end

//This runs after the database has been connected.
function DATABASE:onConnected()
	MsgN("[Framework] Connected to database!");
	MsgN("[Framework] MySQLOO database version " .. mysqloo.MYSQL_INFO);
	MsgN("[Framework] Running MySQLOO version " .. mysqloo.VERSION);
	
	local PlayerTable = database:query("CREATE TABLE IF NOT EXISTS Players(ID INT NOT NULL AUTO_INCREMENT, SteamName TEXT, SteamID TEXT, IP TEXT, UserLevel INT, Whitelisted BOOL, PRIMARY KEY (ID));");
	PlayerTable:start();
	
	local CharacterTable = database:query("CREATE TABLE IF NOT EXISTS Characters(ID INT NOT NULL AUTO_INCREMENT, Name TEXT, Faction TEXT, Inventory TEXT, Flags TEXT, PRIMARY KEY (ID));");
	CharacterTable:start();
	
	function PlayerTable:onSuccess(data)
		MsgN("[Framework]: Player table verification successful, ready to recieve data.");
	end
	
	function PlayerTable:onError(err, sql)
		ErrorNoHalt("[Framework] CRITICAL ERROR (2): Failed to verify table!\n");
		ErrorNoHalt("[Framework] CRITICAL ERROR (2): " .. err .. "\n");
		ErrorNoHalt("[Framework] CRITICAL ERROR (2): " .. sql .. "\n");
	end
	
	function CharacterTable:onSuccess(data)
		MsgN("[Framework]: Character table verification successful, ready to recieve data.");
	end
	
	function CharacterTable:onError(err, sql)
		ErrorNoHalt("[Framework] CRITICAL ERROR (3): Failed to verify table!\n");
		ErrorNoHalt("[Framework] CRITICAL ERROR (3): " .. err .. "\n");
		ErrorNoHalt("[Framework] CRITICAL ERROR (3): " .. sql .. "\n");
	end
end

//This runs if there's a problem with the entered
//config data.
function DATABASE:onConnectionFailed(err)
	ErrorNoHalt("[Framework] CRITICAL ERROR (1): Failed to connect to database!\n");
	ErrorNoHalt("[Framework] CRITICAL ERROR (1): " .. err .. "\n");
end

//This runs every time 
function FirstJoin(ply, steamID, uID)
	if ply:IsBot() then
		return;
	end
	
	local PlayerCheck = database:query("SELECT * FROM Players WHERE SteamID = '" .. steamID .. "';");
	PlayerCheck:start();
	
	function PlayerCheck:onSuccess(data)
		if IsEmpty(data) then
			local PlayerCreate = database:query("INSERT INTO `Players` (SteamName, SteamID, IP, UserLevel, Whitelisted) VALUES ('" .. ply:Name() .. "', '" .. steamID .. "', '" .. ply:IPAddress() .. "', 1, 0);");
			PlayerCreate:start();
			
			function PlayerCreate:onSuccess(data)
				MsgN("[Framework]: Data stored for new player " .. ply:Name() .. ".");
			end
		else
			MsgN("[Framework]: Data found for " .. ply:Name() .. ", resuming...");
		end
	end
	
	function PlayerCheck:onError(err, sql)
		ErrorNoHalt("[Framework] CRITICAL ERROR (4): Failed to verify playerdata!\n");
		ErrorNoHalt("[Framework] CRITICAL ERROR (4): " .. err .. "\n");
		ErrorNoHalt("[Framework] CRITICAL ERROR (4): " .. sql .. "\n");
	end
end
hook.Add("PlayerAuthed", "FirstJoin", FirstJoin);