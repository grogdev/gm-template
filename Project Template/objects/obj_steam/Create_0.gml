/// @description


#macro STEAM_BUILD false

#macro STEAM_BUILD:SteamDev true



if not STEAM_BUILD {
    instance_destroy()
    exit
}


