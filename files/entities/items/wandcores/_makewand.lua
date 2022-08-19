dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/gun/procedural/gun_procedural.lua")

local core_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( core_id )

local handlecomp = EntityGetComponent( core_id, "VariableStorageComponent", "wand_handle" )
local bracecomp = EntityGetComponent( core_id, "VariableStorageComponent", "wand_brace" )
local ctier = ComponentGetValue2( EntityGetComponent( core_id, "VariableStorageComponent", "core_tier" ), "value_string" )
local coretier = tonumber(ctier)

if ComponentGetValue2( handlecomp, "value_string" ) == "handle" and ComponentGetValue2( bracecomp, "value_string" ) == "brace" then
    EntityLoad("mods/hadal/files/entities/items/wandcores/_wand.xml", x, y)
    hadal_wand(25 * coretier, coretier, false)
    EntityKill(core_id)
    GamePrint("Wand created!")
end

function hadal_wand( cost, level, force_unshuffle ) --modified generate_gun()
	local wand = EntityGetInRadiusWithTag( x, y, radius, "hadalwand")[1]
    if EntityHasTag( wand, "hadalbuilt" ) == true then return end
	SetRandomSeed( x, y )

	local gun = get_gun_data( cost, level, force_unshuffle )
	make_wand_from_gun_data( gun, wand, level )
	wand_add_random_cards( gun, wand, level )
    EntityAddTag( wand, "hadalbuilt")
end