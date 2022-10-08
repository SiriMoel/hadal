-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/lib/utilities.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )

function init( x, y, w, h )
	LoadPixelScene( "mods/hadal/files/biome/temple/solid.png", "", x, y-40+300, "", true )
    LoadPixelScene( "mods/hadal/files/biome/temple/temple_top.png", "mods/hadal/files/biome/temple/temple_top_visual_right.png", x, y-40, "", true )
end