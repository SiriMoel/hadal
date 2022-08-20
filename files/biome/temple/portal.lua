dofile_once("data/scripts/lib/utilities.lua")

local portal_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( portal_id )
local radius = 12
local player = EntityGetInRadiusWithTag( x, y, radius, "player_unit" )[1]
local orbcount = GameGetOrbCountThisRun()

--local mountaincomp = EntityGetComponent( player, "VariableStorageComponent", "hadalmountains" )
--local mountaincount = tonumber(ComponentGetValue( EntityGetComponent( player, "VariableStorageComponent", "hadalmountains" ), "value_string" ))
if GlobalsGetValue("hadalmountains") == nil then
    GlobalsSetValue("hadalmountains", "0")
end

local mountaincount = tonumber(GlobalsGetValue("hadalmountains"))

if mountaincount == nil then 
    mountaincount = 0
end

local orbreq = 0 + mountaincount * 1.3

-- destination coords
local dx = x
local dy = y + 300

-- orb
if orbcount >= orbreq then
    if player == nil then return end
    EntitySetTransform( player, dx, dy )
    mountaincount = mountaincount + 1
    GamePrint("You have been to " .. mountaincount .. " Holy Mountains now." )
    GamePrint("You will need " .. orbreq .. " orbs to enter the next Mountain.")
    GlobalsSetValue("hadalmoutnains", tostring(mountaincount))
else   
    GamePrint("You do not have enough orbs.")
end