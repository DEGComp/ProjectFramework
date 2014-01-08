function fwCharMenu(ply)
	local base = vgui.Create("DFrame")
	local close = vgui.Create("DButton")
	local model = vgui.Create("DModelPanel")
	base:SetPos(0, 0)
	base:SetSize(ScrW(), ScrH())
	base:SetVisible(true)
	base:SetTitle("")
	base:SetDraggable(false)
	base:ShowCloseButton(false)
	base:MakePopup()
	
	model:SetParent(base)
	model:SetModel(LocalPlayer():GetModel())
	model:SetSize(500, 500)
	model:SetCamPos(Vector( 90,  0,  0))
	model:SetLookAt(Vector( 0,  0,  20 ))
	model:SetPos(ScrW() / 2 - 250, ScrH() / 2 - 250)
	
	close:SetParent(base)
	close:SetText("Close menu")
	close:SetSize(250, 50)
	close:SetPos(100, 55)
	close.DoClick = function()
		base:Close()
	end
	
	function base:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(20, 20, 20, 220))
	end
	
	function close:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(20, 20, 20, 0))
	end
end