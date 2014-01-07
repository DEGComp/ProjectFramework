AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function GM:Initialize()
	print("Framework serverside initializing...")
	self.BaseClass:Initialize()
end

function GM:ShowSpare2(ply)
	umsg.Start("fw_menu_open", ply)
	umsg.End()
end