ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/hadal/files/perk_list_appends.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/hadal/files/actions_appends.lua" )
ModMagicNumbersFileAdd( "mods/hadal/files/magic_numbers.xml" ) 
ModMaterialsFileAdd("mods/hadal/files/materials.xml")

local nxml = dofile_once("mods/mould_n/lib/nxml.lua")

local content = ModTextFileGetContent("data/biome/_biomes_all.xml")
local xml = nxml.parse(content)
xml:add_children(nxml.parse_many[[
	<Biome height_index="0" color="ffaa0c10" biome_filename="mods/hadal/files/biome/temple/wall.xml" />
    <Biome height_index="0" color="ffce1016" biome_filename="mods/hadal/files/biome/temple/temple.xml" />
]])
ModTextFileSetContent("data/biome/_biomes_all.xml", tostring(xml))

--set
ModTextFileSetContent("data/entities/projectiles/deck/black_hole.xml", "mods/hadal/files/set/black_hole.xml")
ModTextFileSetContent("data/scripts/projectiles/black_hole_gravity.lua", "mods/hadal/files/set/black_hole_gravity.lua")
ModTextFileSetContent("data/entities/animals/shotgunner_weak.xml", "mods/hadal/files/set/shotgunner_weak.xml")

--biome script appends
ModLuaFileAppend( "data/scripts/biomes/coalmine.lua", "mods/hadal/files/biome_append/coalmine.lua" )
ModLuaFileAppend( "data/scripts/biomes/coalmine_alt.lua", "mods/hadal/files/biome_append/coalmine_alt.lua" )
ModLuaFileAppend( "data/scripts/biomes/excavationsite.lua", "mods/hadal/files/biome_append/excavationsite.lua" )
ModLuaFileAppend( "data/scripts/biomes/fungicave.lua", "mods/hadal/files/biome_append/fungicave.lua" )
ModLuaFileAppend( "data/scripts/biomes/snowcave.lua", "mods/hadal/files/biome_append/snowcave.lua" )
ModLuaFileAppend( "data/scripts/biomes/snowcastle.lua", "mods/hadal/files/biome_append/snowcastle.lua" )
ModLuaFileAppend( "data/scripts/biomes/winter_caves.lua", "mods/hadal/files/biome_append/winter_caves.lua" )
ModLuaFileAppend( "data/scripts/biomes/winter.lua", "mods/hadal/files/biome_append/winter_caves.lua" )
ModLuaFileAppend( "data/scripts/biomes/vault_frozen.lua", "mods/hadal/files/biome_append/vault_frozen.lua" )

--player
function OnPlayerSpawned( player_entity )

    local key = "HADAL_MODIFY_PLAYER_DATA"
	local is_initialized = GlobalsGetValue( key ) 
	if( is_initialized == "yes" ) then
		return
	end
	GlobalsSetValue( key, "yes" )

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

			melee = melee * 1
			projectile = projectile * 1
			explosion = explosion * 1
			electricity = electricity * 1.3
			fire = fire * 1
			drill = drill * 1
			slice = slice * 1.3
			ice = ice * 1
            healing = healing * 0.75
            physics_hit = physics_hit * 2
			radioactive = radioactive * 1
			poison = poison * 2

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