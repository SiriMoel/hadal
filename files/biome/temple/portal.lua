dofile_once("data/scripts/lib/utilities.lua")

local portal_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( portal_id )
local radius = 12
local player = GetEntityInRadiusWithTag( x, y, radius, "player_unit" )[1]
local orbcount = GameGetOrbCountThisRun()

--local mountaincomp = EntityGetComponent( player, "VariableStorageComponent", "hadalmountains" )
--local mountaincount = tonumber(ComponentGetValue( EntityGetComponent( player, "VariableStorageComponent", "hadalmountains" ), "value_string" ))
if GlobalsGetValue("hadalmountains") == nil then
    GlobalsSetValue("hadalmountains", "0")
end

local mountaincount = tonumber(GlobalsGetValue("hadalmountains"))

local orbreq = 0 + mountaincount * 1.3

-- destination coords
local dx = x
local dy = y + 282

-- orb
if orbcount >= orbreq then
    EntitySetTransform( player, dx, dy )
    local mountains = mountaincount + 1
    GlobalsSetValue("hadalmoutnains", tostring(mountains))
else   
    GamePrint("You do not have enough orbs.")
end