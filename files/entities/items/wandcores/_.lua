dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/gun/procedural/gun_procedural.lua")

local core_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( core_id )
local radius = 10

local handlecomp = EntityGetComponent( core_id, "VariableStorageComponent", "wand_handle" )
local bracecomp = EntityGetComponent( core_id, "VariableStorageComponent", "wand_brace" )
local coretier = tonumber(ComponentGetValue( EntityGetComponent( core_id, "VariableStorageComponent", "core_tier" ), "value_string" ))

if ComponentGetValue( handlecomp, "value_string" ) == "empty" then
    local handle = EntityGetInRadiusWithTag( x, y, radius, "wandhandle" )[1]
    ComponentSetValue( handlecomp, "value_string", "handle" )
    EntityKill(handle)
end

if ComponentGetValue( bracecomp, "value_string" ) == "empty" then
    local brace = EntityGetInRadiusWithTag( x, y, radius, "wandbrace" )[1]
    ComponentSetValue( bracecomp, "value_string", "brace" )
    EntityKill(brace)
end

if ComponentGetValue( handlecomp, "value_string" ) == "handle" and ComponentGetValue( bracecomp, "value_string" ) == "brace" then
    EntityLoad("mods/hadal/files/entities/items/wandcores/_wand.xml", x, y)
    hadal_wand(25 * coretier, coretier, false)
    EntityKill(core_id)
end

function hadal_wand( cost, level, force_unshuffle ) --modified generate_gun()
	local entity_id = EntityGetInRadiusWithTag("hadalwand")[1]
	local x, y = EntityGetTransform( entity_id )
	SetRandomSeed( x, y )

	local gun = get_gun_data( cost, level, force_unshuffle )
	make_wand_from_gun_data( gun, entity_id, level )
	wand_add_random_cards( gun, entity_id, level )
end