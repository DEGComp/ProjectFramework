/*
[[----------------------------------------------]]
[[--  Crystal Blue  ----------------------------]]
[[--  All rights reserved.  --------------------]]
[[----------------------------------------------]]
*/

AddCSLuaFile("core/derma/cl_character.lua")
AddCSLuaFile("core/derma/cl_directory.lua")

include("config/sv_config.lua");
include("core/sv_config.lua");

local CCore = CCore;
local umsg = umsg;

function CCore:Initialize()
	MsgN("[CCore] Initialized server-side!");
	
	self.BaseClass:Initialize();
end

function CCore:ShowSpare2(ply)
	umsg.Start("CCore_Open_Menu", ply);
	umsg.End();
end