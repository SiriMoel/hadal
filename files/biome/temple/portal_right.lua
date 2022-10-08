dofile_once("data/scripts/lib/utilities.lua")

local portal_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( portal_id )
local radius = 50
local player = EntityGetInRadiusWithTag( x, y, radius, "player_unit" )[1]

-- destination coords
local dx = x - 512
local dy = y

if player == nil then return end
EntitySetTransform( player, dx, dy )