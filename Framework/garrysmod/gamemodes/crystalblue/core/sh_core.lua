/*
[[----------------------------------------------]]
[[--  Crystal Blue  ----------------------------]]
[[--  All rights reserved.  --------------------]]
[[----------------------------------------------]]
*/

DeriveGamemode("sandbox");

CCore = CCore or GM;
CCore.Name = "Crystal Blue - Framework";
CCore.Author = "Crystal Blue Team";
CCore.Desc = "Crystal Blue is a roleplay gamemode created for the people."
CCore.Email = "visiongamingjake@hotmail.com";
CCore.Website = "http://deencryptiongaming.org/ & http://serconker.felthatters.net/";

/*  Enums  */
COLOR_BLACK = Color(0, 0, 0, 255);
COLOR_WHITE = Color(255, 255, 255, 255);
COLOR_GRAY = Color(125, 125, 125, 255);

TEAM_SPECTATOR = TEAM_SPECTATOR;
TEAM_PLAYER = 1;

/*  Teams  */
team.SetUp(TEAM_SPECTATOR, "Spectator", COLOR_WHITE);
team.SetUp(TEAM_PLAYER, "Player", COLOR_GRAY);

/*  Funcs  */
function CCore:GetGameDescription()
	return self.Name;
end