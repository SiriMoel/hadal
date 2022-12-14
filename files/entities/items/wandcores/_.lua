dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/gun/procedural/gun_procedural.lua")
dofile_once("mods/hadal/files/lusca_curse.lua")

--GamePrint("1")

local core_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( core_id )
local radius = 15

local tags = EntityGetTags(GetUpdatedEntityID())
local coretier = tonumber(tags:match("wandcore_t(%d+)"))
local handle = EntityGetInRadiusWithTag( x, y, radius, "wandhandle" )[1]
local brace = EntityGetInRadiusWithTag( x, y, radius, "wandbrace" )[1]

--GamePrint("2")

if coretier == nil then
    coretier = math.random(1, 6)
    Print("coretier was nil")
end

--GamePrint("3")

if handle ~= nil then
    --GamePrint("handle")
end
if brace ~= nil then
    --GamePrint("brace")
end

if handle ~= nil and brace ~= nil then
    --GamePrint("4")
    local wand = EntityLoad("mods/hadal/files/entities/items/wandcores/_wand.xml", x, y)
    if EntityHasTag( wand, "hadalbuilt" ) == true then return end
	SetRandomSeed( x, y )
	local gun = get_gun_data( 25 * coretier, coretier, false )
	make_wand_from_gun_data( gun, wand, coretier )
	wand_add_random_cards( gun, wand, coretier )
    EntityAddTag( wand, "hadalbuilt")
    EntityKill(handle)
    EntityKill(brace)
    EntityKill(core_id)
    GamePrint("Wand created!")
    lusca_curse( "wand_crafting" )
    --GamePrint("5")
end