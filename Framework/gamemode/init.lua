AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
 
include( 'shared.lua' )
DEFINE_BASECLASS( "gamemode_base" )
function GM:PlayerSpawn( ply )
    self.BaseClass:PlayerSpawn( ply )   
 
    ply:SetGravity  ( 1 )  
    ply:SetMaxHealth( 100, true )  
 
    ply:SetWalkSpeed( 190 )  
    ply:SetRunSpeed ( 235 ) 
 
end

function GM:PlayerLoadout( ply )
	
end

function GM:PlayerInitialSpawn( ply )
	   
end

function GM:ShowSpare2(ply)
		umsg.Start("FW_menu_open",ply)
		umsg.End()
end