dofile_once("data/scripts/lib/utilities.lua")

local timer = GetUpdatedEntityID()
local x, y = EntityGetTransform(timer)

local radius = 200

local player = EntityGetInRadiusWithTag( x, y, radius, "player_unit" )[1]

if player ~= nil then
    GamePrintImportant( "You are too slow!", "This is so sad." )
    EntityLoad( "mods/hadal/files/entities/animals/steve/steve.xml", x, y )
end