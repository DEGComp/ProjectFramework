AddCSLuaFile("cl_init.lua")
AddCSLuaFile("sh_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_charmenu.lua")
AddCSLuaFile("cl_directory.lua")

include("sv_init.lua")
include("sh_init.lua")
include("shared.lua")

function GM:Initialize()
	print("Framework serverside initializing...")
	
	self.BaseClass:Initialize()
end