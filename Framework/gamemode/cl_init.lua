include("shared.lua")
include("cl_charmenu.lua")
include("cl_directory.lua")

function GM:Initialize()
	print("Framework clientside initializing...")
	self.BaseClass:Initialize()
end

function fwMenuDerma(ply)
	local base = vgui.Create("DFrame")
	local chars = vgui.Create("DButton")
	local close = vgui.Create("DButton")
	local directory = vgui.Create("DButton")
	
	base:SetPos(0, 0)
	base:SetSize(ScrW(), ScrH())
	base:SetVisible(true)
	base:SetTitle("")
	base:SetDraggable(false)
	base:ShowCloseButton(false)
	base:MakePopup()

 	close:SetParent(base)
	close:SetText("Close menu")
	close:SetSize(150, 20)
	close:SetPos(100, 55)
	close.DoClick = function()
		base:Close()
	end

	chars:SetParent(base)
	chars:SetText("Character selection")
	chars:SetSize(150, 20)
	chars:SetPos(100, 150)
	chars.DoClick = function()
		chat.AddText(Color(40, 40, 60), "Char menu will now appear, maybe?")
		base:Close()
		FW_Charmenu(ply)
	end

	directory:SetParent(base)
	directory:SetText("Directory")
	directory:SetSize(150, 20)
	directory:SetPos(100, 175)
	directory.DoClick = function()
		FW_Directory()
	end

	function base:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(20, 20, 20, 220))
	end
	
	function chars:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 120))
	end
	
	function directory:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 120))
	end
	
	function close:Paint(w, h)
		draw.RoundedBox(4, 0, 0, w, h, Color(255, 255, 255, 120))
	end
end
usermessage.Hook("FW_menu_open", fwMenuDerma)