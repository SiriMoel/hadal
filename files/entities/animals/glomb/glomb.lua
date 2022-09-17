dofile_once("data/scripts/lib/utilities.lua")

local id = GetUpdatedEntityID()
local x, y = EntityGetTransform( id )
local radius = 150
local player = EntityGetInRadiusWithTag( x, y, radius, "player_unit" )[1]

if player == nil then return end

local px, py, pr = EntityGetTransform(player)
local dx = px
local dy = py - 20
local dr = pr * -1

--GamePrint(pr)

local m = 120

if pr > 180 then
    dy = py + m
else
    dy = py - m
end

EntityApplyTransform( id, dx, dy, dr )