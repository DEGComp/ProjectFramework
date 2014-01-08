AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("framework/framework/cl_kernel.lua")
AddCSLuaFile("framework/framework/sh_kernel.lua")
AddCSLuaFile("framework/framework/derma/cl_character.lua")
AddCSLuaFile("framework/framework/derma/cl_directory.lua")

include("shared.lua")
include("framework/framework/sv_kernel.lua")
include("framework/framework/sh_kernel.lua")

function GM:Initialize()
	print("Framework kernel serverside initializing...")
	
	self.BaseClass:Initialize()
end