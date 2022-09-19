CHEST_LEVEL = 4
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/director_helpers_design.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/entities/animals/boss_centipede/rewards/spawn_rewards.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xffffd1a1, "spawn_sampo_spot" )

function spawn_small_enemies( x, y ) end
function spawn_big_enemies( x, y ) end
function spawn_props( x, y ) end
function spawn_props2( x, y ) end
function spawn_props3( x, y ) end
function spawn_lamp( x, y ) end
function spawn_chest( x, y ) end
function spawn_blood( x, y ) end
function load_pixel_scene( x, y ) end
function load_pixel_scene2( x, y ) end
function spawn_unique_enemy( x, y ) end
function spawn_unique_enemy2( x, y ) end
function spawn_unique_enemy3( x, y ) end
function spawn_save( x, y ) end
function spawn_ghostlamp( x, y ) end
function spawn_persistent_teleport( x, y ) end
function spawn_candles( x, y ) end

function init( x, y, w, h )
	LoadPixelScene( "data/biome_impl/boss_victoryroom.png", "data/biome_impl/boss_victoryroom_visual.png", x, y, "data/biome_impl/boss_victoryroom_background.png", true )
end

function spawn_sampo_spot(x, y)
	EntityLoad( "data/entities/animals/boss_centipede/ending/ending_sampo_spot_underground.xml", x, y )
	EntityLoad( "data/entities/animals/boss_centipede/boss_victoryroom_mechanism.xml", x, y-30 )
	EntityLoad( "data/entities/animals/boss_centipede/boss_victoryroom_ambience.xml", x, y-30 )

    local oc = GameGetOrbCountThisRun()

	if GameHasFlagRun("lusca_dead") ~= true then return end
	
	if oc == 0 then -- what
		EntityLoad( "mods/hadal/files/entities/items/memorybooks/zero.xml", x, y-30 )
	elseif oc <= 6 then -- some orbs
		EntityLoad( "mods/hadal/files/entities/items/memorybooks/normal.xml", x, y-30 )
	elseif oc > 6 and oc < 11 then -- some orbs
		EntityLoad( "mods/hadal/files/entities/items/memorybooks/ten.xml", x, y-30 )
	elseif oc == 11 then -- all + glomb
		EntityLoad( "mods/hadal/files/entities/items/memorybooks/eleven.xml", x, y-30 )
	elseif oc > 11 then -- this shouldnt be possible
		EntityLoad( "mods/hadal/files/entities/items/memorybooks/elevenplus.xml", x, y-30 )
	end
end

function spawn_items(x, y)
	spawn_rewards( x, y )
end