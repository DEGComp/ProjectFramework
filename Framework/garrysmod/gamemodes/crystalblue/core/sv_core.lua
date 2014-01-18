/*
[[----------------------------------------------]]
[[--  Crystal Blue  ----------------------------]]
[[--  All rights reserved.  --------------------]]
[[----------------------------------------------]]
*/

DeriveGamemode("sandbox");

AddCSLuaFile("crystalblue/core/derma/cl_character.lua")
AddCSLuaFile("crystalblue/core/derma/cl_directory.lua")

include("crystalblue/config/sv_config.lua");

local CCore = CCore;
local Error = Error;
local MsgN = MsgN;
local umsg = umsg;

function CCore:Initialize()
	if game.SinglePlayer() then
		Error("[Mastermind] CRITICAL ERROR (1): " .. self.Name .. " is not made for singleplayer! Please start " .. self.Name .. " on an online server.");
	end

	self.BaseClass:Initialize();
	
	MsgN("[CCore] Initialized server-side!");
	math.randomseed(os.time());
end

function CCore:PlayerInitalSpawn(ply)
	ply:SetLoading(true);
	
	umsg.Start("CCore_Start_Intro", ply);
	umsg.End();
end

function CCore:PlayerSpawn(ply)
	if ply:IsLoading() then
		GAMEMODE:PlayerSpawnAsSpectator(ply);
		ply:RemoveAllItems();
		ply:SetLoading(false);
	end
end

function CCore:ShowSpare2(ply)
	umsg.Start("CCore_Open_Menu", ply);
	umsg.End();
end