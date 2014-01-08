AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("framework/framework/cl_kernal.lua")
AddCSLuaFile("framework/framework/sh_kernal.lua")
AddCSLuaFile("framework/framework/derma/cl_character.lua")
AddCSLuaFile("framework/framework/derma/cl_directory.lua")

include("shared.lua")
include("framework/framework/sv_kernal.lua")
include("framework/framework/sh_kernal.lua")

function GM:Initialize()
	print("Framework kernel serverside initializing...")
	
	self.BaseClass:Initialize()
end

function GM:ShowSpare2(ply)
	umsg.Start("fw_menu_open", ply)
	umsg.End()
end