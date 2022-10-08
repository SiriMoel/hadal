dofile_once("data/scripts/lib/utilities.lua")

local entity = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity )
local radius = 200
local player = EntityGetInRadiusWithTag( x, y, radius, "player_unit" )[1]

if player == nil then return end
EntitySetTransform( player, x, y )
EntityKill(entity)