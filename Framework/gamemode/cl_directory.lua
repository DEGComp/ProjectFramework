function fwDirectory(page)
	if(page==nil)then
		local commands = {}
		local dbase = vgui.Create("DFrame")
		local inim = vgui.Create("DImage", dbase)
		local info = vgui.Create("DButton",  dbase)
		local close = vgui.Create("DButton",  dbase)
		dbase:SetPos(ScrW() / 2.65, 0)
		dbase:SetSize(ScrW() / 2.65, ScrH() / 2 + ScrH() / 4 + 140)
		dbase:SetVisible(true)
		dbase:SetTitle("")
		dbase:SetDraggable(true)
		dbase:ShowCloseButton(false)
		dbase:MakePopup()
	
		inim:SetImage("VGUI/directory_resized.png")
		inim:SetPos(0, 25)
		inim:SetSize(1050, 670)

		info:SetPos(200, 155)
		info:SetFont("default")
		info:SetText("")
		info:SetSize(150, 50)
		info.DoClick = function()
			dbase:Close()
			fwDirectory(1)
		end
		
		close:SetPos(80, 593)
		close:SetFont("default")
		close:SetText("")
		close:SetSize(75, 100)
		close.DoClick = function()
			dbase:Close()
		end
		
		function info.Paint(w, h)
			draw.SimpleText("Infomation", "Trebuchet24", 0, 0, Color(100, 60, 40, 255))
		end
		
		function dbase:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(20, 20, 20, 0))
		end
		
		function close:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(20, 20, 20, 60))
		end
	elseif(page==1)then
		local commands = {}
		local dbase = vgui.Create("DFrame")
		local inim = vgui.Create("DImage", dbase)
		local info = vgui.Create("DButton",  dbase)
		local close = vgui.Create("DButton",  dbase)
		dbase:SetPos(ScrW() / 7, 0)
		dbase:SetSize(ScrW() / 1.3, ScrH() / 2 + ScrH() / 4 + 140)
		dbase:SetVisible(true)
		dbase:SetTitle("")
		dbase:SetDraggable(true)
		dbase:ShowCloseButton(false)
		dbase:MakePopup()
	
		inim:SetImage("VGUI/directory_resized.png")
		inim:SetPos(0, 25)
		inim:SetSize(1050, 670)

		info:SetPos(200, 155)
		info:SetFont("default")
		info:SetText("")
		info:SetSize(150, 50)
		info.DoClick = function()
			dbase:Close()
			fwDirectory(1)
		end
		
		close:SetPos(80, 593)
		close:SetFont("default")
		close:SetText("")
		close:SetSize(75, 100)
		close.DoClick = function()
			dbase:Close()
		end
		
		function info.Paint(w, h)
			draw.SimpleText("Infomation", "Trebuchet24", 0, 0, Color(100, 60, 40, 255))
		end
		
		function dbase:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(20, 20, 20, 0))
		end
		
		function close:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(20, 20, 20, 60))
		end
	end
end