/*
[[----------------------------------------------]]
[[--  Edit anything below to your liking.  -----]]
[[----------------------------------------------]]
*/

local CCore = CCore;
CCore.Config = {};

CCore.Config.DATABASE_HOST = "localhost";
CCore.Config.DATABASE_USER = "root";
CCore.Config.DATABASE_PASS = "";
CCore.Config.DATABASE_NAME = "fw_data";
CCore.Config.DATABASE_PORT = 3306;

CCore.Config.WHITELIST_ENABLED = false;

//Add SteamID's here, make sure to add commas
//after each entry, save for the last one!
CCore.Config.WHITELISTS = {
  "zip",
  "zam",
  "STEAM_0:1:26293888"
}