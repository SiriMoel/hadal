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

function OnPlayerSpawned( player_entity )

end

--spell changes
ModTextFileSetContent("data/entities/projectiles/deck/black_hole.xml", "mods/hadal/files/action_changes/black_hole.xml")
ModTextFileSetContent("data/scripts/projectiles/black_hole_gravity.lua", "mods/hadal/files/action_changes/black_hole_gravity.lua")

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