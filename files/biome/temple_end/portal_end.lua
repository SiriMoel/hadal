dofile_once("data/scripts/lib/utilities.lua")

local portal_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( portal_id )
local radius = 12
local player = EntityGetInRadiusWithTag( x, y, radius, "player_unit" )[1]

-- destination coords
local dx = 0
local dy = 0

if player == nil then return end
EntitySetTransform( player, dx, dy )
GamePrint("THIS PORTAL NEEDS DESTINATION COORDINATES")