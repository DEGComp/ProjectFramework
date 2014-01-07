DeriveGamemode("sandbox")

GM.Name = "Project Framework"
GM.Author = "Frenjo | Serconker | Riekelt"
GM.Email = ""
GM.Website = "http://deencryptiongaming.org/"

function GM:Initialize()
	print("Framework shared initializing...")
	
	self.BaseClass:Initialize()
end