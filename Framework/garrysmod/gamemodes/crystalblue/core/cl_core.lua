/*
[[----------------------------------------------]]
[[--  Crystal Blue  ----------------------------]]
[[--  All rights reserved.  --------------------]]
[[----------------------------------------------]]
*/

include("crystalblue/core/derma/cl_character.lua")
include("crystalblue/core/derma/cl_directory.lua")

local CCore = CCore;
local vgui = vgui;
local draw = draw;
local surface = surface;
local chat = chat;
local umsg = umsg;
local usermessage = usermessage;

function CCore:Initialize()
	MsgN("[CCore] Initialized client-side!");
	
	self.BaseClass:Initialize();
end

function CCore:HUDShouldDraw(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if(v == name) then
			return false
		else
			return true
		end
	end
end

function CCore:OpenDerma(ply)
	local base = vgui.Create("DFrame")
	local inima = vgui.Create("DImage", base)
	local chars = vgui.Create("DButton")
	local close = vgui.Create("DButton", base)
	local directory = vgui.Create("DButton")
	
	base:SetPos(ScrW() / 2.65, 0)
	base:SetSize(ScrW() / 2.65, ScrH() / 2 + ScrH() / 4 + 140)
	base:SetVisible(true)
	base:SetTitle("")
	base:SetDraggable(true)
	base:ShowCloseButton(false)
	base:MakePopup()

	inima:SetImage("VGUI/directory_resized.png")
	inima:SetPos(0, 25)
	inima:SetSize(1050, 670)

	close:SetPos(80, 593)
	close:SetFont("default")
	close:SetText("")
	close:SetSize(75, 100)
	close.DoClick = function()
		base:Close()
	end

	chars:SetParent(base)
	chars:SetText("")
	chars:SetSize(150, 20)
	chars:SetPos(170, 160)
	chars.DoClick = function()
		chat.AddText(Color(100, 60, 40), "Char menu will now appear, maybe?")
		base:Close()
		cbCharMenu(ply)
	end

	directory:SetParent(base)
	directory:SetText("")
	directory:SetSize(90, 30)
	directory:SetPos(200, 250)
	directory.DoClick = function()
		cbDirectory()
	end

	function base:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(20, 20, 20, 0))
	end
	
	function chars:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 120))
	end
	
	function directory:Paint(w, h)
		draw.SimpleText("Directory", "Trebuchet24", 0, 0, Color(100, 60, 40, 255))
	end
	
	function chars.Paint(w, h)
		draw.SimpleText("Character menu", "Trebuchet24", 0, 0, Color(100, 60, 40, 255))
	end
	
	function close:Paint(w, h)
	draw.RoundedBox(4, 0, 0, w, h, Color(0, 0, 0, 30))
	end
end
usermessage.Hook("CCore_Open_Menu", CCore:OpenDerma)