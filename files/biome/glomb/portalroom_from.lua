-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/lib/utilities.lua")
dofile( "data/scripts/gun/gun_actions.lua" )
dofile( "mods/hadal/files/entities/items/templewands/_.lua" )
dofile( "data/scripts/perks/perk.lua" )

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff00b665, "portal" )

function init( x, y, w, h )
	LoadPixelScene( "mods/hadal/files/biome/glomb/portalroomno.png", "", x, y, "mods/hada/files/biome/glomb/glomb_arena_background.png", true )
end

function portal( x, y )
    EntityLoad( "mods/hadal/files/biome/glomb/portal_from.xml", x, y )
end
