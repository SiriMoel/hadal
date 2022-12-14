ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/hadal/files/perk_list_appends.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/hadal/files/actions_appends.lua" )
--ModLuaFileAppend( "data/scripts/director_helpers.lua", "mods/hadal/files/director_helpers_appends.lua")
ModMagicNumbersFileAdd( "mods/hadal/files/magic_numbers.xml" ) 

local nxml = dofile_once("mods/hadal/lib/nxml.lua")

--biomes
local content = ModTextFileGetContent("data/biome/_biomes_all.xml")
local xml = nxml.parse(content)
xml:add_children(nxml.parse_many[[
	<Biome height_index="0" color="ffaa0c10" biome_filename="mods/hadal/files/biome/temple/wall.xml" />
    <Biome height_index="0" color="ffce1016" biome_filename="mods/hadal/files/biome/temple/temple.xml" />
	<Biome height_index="0" color="ffb80c29" biome_filename="mods/hadal/files/biome/temple/wall_left.xml" />
	<Biome height_index="0" color="ffb80c3f" biome_filename="mods/hadal/files/biome/temple/wall_right.xml" /> 
	<Biome height_index="0" color="ffb81c29" biome_filename="mods/hadal/files/biome/temple/wall_left_no.xml" />
	<Biome height_index="0" color="ffb80c54" biome_filename="mods/hadal/files/biome/temple/wall_right_no.xml" />

	<Biome height_index="0" color="ffe4104c" biome_filename="mods/hadal/files/biome/temple_end/temple.xml" />
	
	<Biome height_index="0" color="ff826d82" biome_filename="mods/hadal/files/biome/pyramid/boss_arena.xml" />
	<Biome height_index="10" color="ff8e3d3e" biome_filename="data/biome/tower/solid_wall_tower.xml" />
	<Biome height_index="0" color="ffff0061" biome_filename="mods/hadal/files/biome/darkcave/darkcave.xml" /> 
	<Biome height_index="0" color="ffa17fff" biome_filename="mods/hadal/files/biome/maproom/maproom.xml" /> 
	<Biome height_index="0" color="ffffba00" biome_filename="mods/hadal/files/biome/glomb/glomb_arena.xml" />
	<Biome height_index="0" color="ffc48c00" biome_filename="mods/hadal/files/biome/glomb/portalroom_to.xml" />
	<Biome height_index="0" color="ffffcd4f" biome_filename="mods/hadal/files/biome/glomb/portalroom_from.xml" />
	<Biome height_index="0" color="ffd69900" biome_filename="mods/hadal/files/biome/glomb/bossroom.xml" /> 
	<Biome height_index="0" color="ff2d824b" biome_filename="mods/hadal/files/biome/gunroom/gun_room.xml" /> 
]])
ModTextFileSetContent("data/biome/_biomes_all.xml", tostring(xml))

--set
ModTextFileSetContent( "data/entities/projectiles/deck/black_hole.xml", ModTextFileGetContent("mods/hadal/files/set/black_hole.xml") )
ModTextFileSetContent( "data/scripts/projectiles/black_hole_gravity.lua", ModTextFileGetContent("mods/hadal/files/set/black_hole_gravity.lua") )
ModTextFileSetContent( "data/entities/animals/shotgunner_weak.xml", ModTextFileGetContent("mods/hadal/files/set/shotgunner_weak.xml") )
ModTextFileSetContent( "data/entities/animals/boss_alchemist/death.lua", ModTextFileGetContent("mods/hadal/files/set/boss_alchemist_death.lua") )
ModTextFileSetContent( "data/entities/animals/boss_limbs/boss_limbs_death.lua", ModTextFileGetContent("mods/hadal/files/set/boss_limbs_death.lua") )
ModTextFileSetContent( "data/biome/_pixel_scenes.xml", ModTextFileGetContent("mods/hadal/files/set/_pixel_scenes.xml") )
ModTextFileSetContent( "data/entities/animals/boss_centipede/boss_centipede.xml", ModTextFileGetContent("mods/hadal/files/set/boss_centipede.xml") )
ModTextFileSetContent( "data/entities/animals/boss_wizard/death.lua", ModTextFileGetContent("mods/hadal/files/set/boss_wizard_death.lua" ) )
ModTextFileSetContent( "data/entities/animals/boss_robot/death.lua", ModTextFileGetContent("mods/hadal/files/set/boss_robot_death.lua") )
ModTextFileSetContent( "data/entities/animals/boss_ghost/death.lua", ModTextFileGetContent("mods/hadal/files/set/boss_ghost_death.lua") )
ModTextFileSetContent( "data/scripts/items/orb_pickup.lua", ModTextFileGetContent("mods/hadal/files/set/orb_pickup.lua") )
ModTextFileSetContent( "data/scripts/items/drop_money.lua", ModTextFileGetContent("mods/hadal/files/set/drop_money.lua") )
ModTextFileSetContent( "data/biome_impl/spliced/boss_arena.xml", ModTextFileGetContent("mods/hadal/files/set/pixel_scene_boss_arena.xml") )
ModTextFileSetContent( "data/scripts/biomes/boss_arena.lua", ModTextFileGetContent("mods/hadal/files/set/biome_script_boss_arena.lua") )
ModTextFileSetContent( "data/entities/projectiles/deck/machinegun_bullet.xml", ModTextFileGetContent("mods/hadal/files/set/machinegun_bullet.xml") )
ModTextFileSetContent( "data/scripts/biomes/boss_victoryroom.lua", ModTextFileGetContent("mods/hadal/files/set/endroom.lua") )

--biome script appends
ModLuaFileAppend( "data/scripts/biomes/coalmine.lua", "mods/hadal/files/biome_append/coalmine.lua" )
ModLuaFileAppend( "data/scripts/biomes/coalmine_alt.lua", "mods/hadal/files/biome_append/coalmine_alt.lua" )
ModLuaFileAppend( "data/scripts/biomes/excavationsite.lua", "mods/hadal/files/biome_append/excavationsite.lua" )
ModLuaFileAppend( "data/scripts/biomes/fungicave.lua", "mods/hadal/files/biome_append/fungicave.lua" )
ModLuaFileAppend( "data/scripts/biomes/snowcave.lua", "mods/hadal/files/biome_append/snowcave.lua" )
ModLuaFileAppend( "data/scripts/biomes/snowcastle.lua", "mods/hadal/files/biome_append/snowcastle.lua" )
ModLuaFileAppend( "data/scripts/biomes/winter.lua", "mods/hadal/files/biome_append/winter_caves.lua" )
ModLuaFileAppend( "data/scripts/biomes/vault_frozen.lua", "mods/hadal/files/biome_append/vault_frozen.lua" )
ModLuaFileAppend( "data/scripts/biomes/rainforest.lua", "mods/hadal/files/biome_append/jungle.lua" )
ModLuaFileAppend( "data/scripts/biomes/rainforest_dark.lua", "mods/hadal/files/biome_append/jungle.lua" )
ModLuaFileAppend( "data/scripts/biomes/vault.lua", "mods/hadal/files/biome_append/vault.lua" )
ModLuaFileAppend( "data/scripts/biomes/fungiforest.lua", "mods/hadal/files/biome_append/oc.lua" )
ModLuaFileAppend( "data/scripts/biomes/crypt.lua", "mods/hadal/files/biome_append/crypt.lua" )
ModLuaFileAppend( "data/scripts/biomes/wizardcave.lua", "mods/hadal/files/biome_append/wizard_den.lua" )
ModLuaFileAppend( "data/scripts/biomes/pyramid_entrance.lua", "mods/hadal/files/biome_append/pyramid.lua" )
ModLuaFileAppend( "data/scripts/biomes/pyramid_hallway.lua", "mods/hadal/files/biome_append/pyramid.lua" )
ModLuaFileAppend( "data/scripts/biomes/pyramid_left.lua", "mods/hadal/files/biome_append/pyramid.lua" )
ModLuaFileAppend( "data/scripts/biomes/pyramid_right.lua", "mods/hadal/files/biome_append/pyramid.lua" )
ModLuaFileAppend( "data/scripts/biomes/pyramid_top.lua", "mods/hadal/files/biome_append/pyramid.lua" ) 
ModLuaFileAppend( "data/scripts/biomes/the_end.lua", "mods/hadal/files/biome_append/sky.lua" ) 
ModLuaFileAppend( "data/scripts/biomes/clouds.lua", "mods/hadal/files/biome_append/clouds.lua" ) 
ModLuaFileAppend( "data/scripts/biomes/sandcave.lua", "mods/hadal/files/biome_append/sandcave.lua" ) 

--player
function OnPlayerSpawned( player_entity )

    local key = "HADAL_ON_PLAYER_SPAWNED"
	local is_initialized = GlobalsGetValue( key ) 
	if( is_initialized == "yes" ) then
		return
	end
	GlobalsSetValue( key, "yes" )

	local x, y = EntityGetTransform(player_entity)
	--EntityLoad("mods/hadal/files/entities/animals/glomb/glomb.xml", 0, 0)

	--[[EntityAddComponent( player_entity, "LuaComponent", 
    {
        script_source_file = "mods/hadal/files/player.lua",
        execute_every_n_frame = "10",
    } )]]--

	local px, py = EntityGetTransform( player_entity )
	EntityLoad( "mods/hadal/files/entities/items/blackboxes/7.xml", px-30, py )

	local damagemodels = EntityGetComponent( player_entity, "DamageModelComponent" )
	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
			local melee = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "melee" ) )
			local projectile = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "projectile" ) )
			local explosion = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "explosion" ) )
			local electricity = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "electricity" ) )
			local fire = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "fire" ) )
			local drill = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "drill" ) )
			local slice = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "slice" ) )
			local ice = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "ice" ) )
			local healing = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "healing" ) )
			local physics_hit = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "physics_hit" ) )
			local radioactive = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "radioactive" ) )
			local poison = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "poison" ) )

			melee = melee * 1.2
			projectile = projectile * 1.1
			explosion = explosion * 1.1
			electricity = electricity * 1.3
			fire = fire * 1.3
			drill = drill * 1.1
			slice = slice * 1.1
			ice = ice * 1.1
            healing = healing * 1
            physics_hit = physics_hit * 1.3
			radioactive = radioactive * 1.2
			poison = poison * 1.3

			if ModSettingGet("hadal_difficulty.onehit_fire") then
				fire = fire * 10
				radioactive = radioactive * 10
				poison = poison * 10
			end

			if ModSettingGet("hadal_difficulty.onehit_melee") then
				melee = melee * 10
				physics_hit = physics_hit * 10
			end

			ComponentObjectSetValue( damagemodel, "damage_multipliers", "melee", tostring(melee) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "projectile", tostring(projectile) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "explosion", tostring(explosion) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "electricity", tostring(electricity) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "fire", tostring(fire) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "drill", tostring(drill) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "slice", tostring(slice) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "ice", tostring(ice) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "healing", tostring(healing) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "physics_hit", tostring(physics_hit) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "radioactive", tostring(radioactive) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "poison", tostring(poison) )
		end
	end
end