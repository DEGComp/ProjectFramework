include( 'shared.lua' )
 
function Kill_base()
base:Close()
end
function FW_MenuDerma(ply)
	local base = vgui.Create("DFrame")
	local chars = vgui.Create("DButton")
	local close = vgui.Create("DButton")
	local directory = vgui.Create("DButton")
	
	base:SetPos(0,0)
	base:SetSize(ScrW(),ScrH())
	base:SetVisible(true)
	base:SetTitle("")
	base:SetDraggable(false)
	base:ShowCloseButton(false)
	base:MakePopup()

 	close:SetParent(base)
	close:SetText("Close menu")
	close:SetSize(150,20)
	close:SetPos(100,55)
	close.DoClick = function()
		base:Close()
	end

	chars:SetParent(base)
	chars:SetText("Character selection")
	chars:SetSize(150,20)
	chars:SetPos(100,150)
	chars.DoClick = function()
		chat.AddText(Color(40,40,60),"Char menu will now appear, maybe?")
		base:Close()
		FW_Charmenu(ply)
	end

	directory:SetParent(base)
	directory:SetText("Directory")
	directory:SetSize(150,20)
	directory:SetPos(100,175)
	directory.DoClick = function()
		FW_Directory()
	end

	function base:Paint(w,h)
		draw.RoundedBox(0,0,0,w,h,Color(20,20,20,220))
	end
	function chars:Paint(w,h)
		draw.RoundedBox(0,0,0,w,h,Color(255,255,255,120))
	end
	function directory:Paint(w,h)
		draw.RoundedBox(0,0,0,w,h,Color(255,255,255,120))
	end
	function close:Paint(w,h)
		draw.RoundedBox(4,0,0,w,h,Color(255,255,255,120))
	end
end
function FW_Charmenu(ply)
	local base = vgui.Create("DFrame")
	local close = vgui.Create("DButton")
	local model = vgui.Create("DModelPanel")
	base:SetPos(0,0)
	base:SetSize(ScrW(),ScrH())
	base:SetVisible(true)
	base:SetTitle("")
	base:SetDraggable(false)
	base:ShowCloseButton(false)
	base:MakePopup()
	
	model:SetParent(base)
	model:SetModel(LocalPlayer():GetModel())
	model:SetSize( 500, 500 )
	model:SetCamPos( Vector( 90, 0, 0) )
	model:SetLookAt( Vector( 0, 0, 20 ))
	model:SetPos(ScrW()/2-250,ScrH()/2-250)
	
	close:SetParent(base)
	close:SetText("Close menu")
	close:SetSize(250,50)
	close:SetPos(100,55)
	close.DoClick = function()
		base:Close()
	end
	function base:Paint(w,h)
		draw.RoundedBox(0,0,0,w,h,Color(20,20,20,220))
	end
	function close:Paint(w,h)
		draw.RoundedBox(0,0,0,w,h,Color(20,20,20,0))
	end
end
function FW_Directory(page)
	if(page==nil)then
		local commands = {}
		local dbase = vgui.Create("DFrame")
		local inim = vgui.Create("DImage",dbase)
		local info = vgui.Create("DButton", dbase)
		local close = vgui.Create("DButton", dbase)
		dbase:SetPos(ScrW()/2.65,0)
		dbase:SetSize(ScrW()/2.65,ScrH()/2+ScrH()/4+140)
		dbase:SetVisible(true)
		dbase:SetTitle("")
		dbase:SetDraggable(true)
		dbase:ShowCloseButton(false)
		dbase:MakePopup()
	
		inim:SetImage( "VGUI/FW_menu/directory_resized.png" )
		inim:SetPos(0,25)
		inim:SetSize(1050,670)

		info:SetPos(200,155)
		info:SetFont("default")
		info:SetText("")
		info:SetSize(150,50)
		info.DoClick = function()
			dbase:Close()
			FW_Directory(1)
		end
		close:SetPos(80,593)
		close:SetFont("default")
		close:SetText("")
		close:SetSize(75,100)
		close.DoClick = function()
			dbase:Close()
		end
		function info.Paint(w,h)
			draw.SimpleText("Infomation","Trebuchet24",0,0,Color(100,60,40,255))
		end
		function dbase:Paint(w,h)
			draw.RoundedBox(0,0,0,w,h,Color(20,20,20,0))
		end
		function close:Paint(w,h)
			draw.RoundedBox(0,0,0,w,h,Color(20,20,20,60))
		end
	elseif(page==1)then
		local commands = {}
		local dbase = vgui.Create("DFrame")
		local inim = vgui.Create("DImage",dbase)
		local info = vgui.Create("DButton", dbase)
		local close = vgui.Create("DButton", dbase)
		dbase:SetPos(ScrW()/7,0)
		dbase:SetSize(ScrW()/1.3,ScrH()/2+ScrH()/4+140)
		dbase:SetVisible(true)
		dbase:SetTitle("")
		dbase:SetDraggable(true)
		dbase:ShowCloseButton(false)
		dbase:MakePopup()
	
		inim:SetImage( "VGUI/FW_menu/directory_resized.png" )
		inim:SetPos(0,25)
		inim:SetSize(1050,670)

		info:SetPos(200,155)
		info:SetFont("default")
		info:SetText("")
		info:SetSize(150,50)
		info.DoClick = function()
			dbase:Close()
			FW_Directory(1)
		end
		close:SetPos(80,593)
		close:SetFont("default")
		close:SetText("")
		close:SetSize(75,100)
		close.DoClick = function()
			dbase:Close()
		end
		function info.Paint(w,h)
			draw.SimpleText("Infomation","Trebuchet24",0,0,Color(100,60,40,255))
		end
		function dbase:Paint(w,h)
			draw.RoundedBox(0,0,0,w,h,Color(20,20,20,0))
		end
		function close:Paint(w,h)
			draw.RoundedBox(0,0,0,w,h,Color(20,20,20,60))
		end
	end
end
 usermessage.Hook("FW_menu_open",FW_MenuDerma)