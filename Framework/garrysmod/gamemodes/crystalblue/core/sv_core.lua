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
local umsg = umsg;

function CCore:Initialize()
	MsgN("[CCore] Initialized server-side!");
	
	self.BaseClass:Initialize();
end

function CCore:PlayerInitalSpawn(ply)
	ply:SetTeam(TEAM_SPECTATOR);
end

function CCore:ShowSpare2(ply)
	umsg.Start("CCore_Open_Menu", ply);
	umsg.End();
end