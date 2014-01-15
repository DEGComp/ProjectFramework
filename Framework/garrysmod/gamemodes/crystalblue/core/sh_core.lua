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
TEAM_SPECTATOR = TEAM_SPECTATOR;
TEAM_PLAYER = 1;

/*  Funcs  */

function CCore:GetGameDescription()
	return self.Desc;
end

function CCore:CreateTeams()
	team.SetUp(TEAM_PLAYER, "Player", Color(0, 0, 0, 255));
end