DeriveGamemode("sandbox")

GM.Name = "Project Framework"
GM.Author = "Jake | Frenjo | Serconker | Riekelt"
GM.Email = "visiongamingjake@hotmail.com"
GM.Website = "http://deencryptiongaming.org/ & http://serconker.felthatters.net/"

function GM:Initialize()
	print("Framework shared initializing...")
	
	self.BaseClass:Initialize()
end