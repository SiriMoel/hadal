dofile_once("data/scripts/lib/utilities.lua")

local portal_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( portal_id )
local radius = 12
local player = EntityGetInRadiusWithTag( x, y, radius, "player_unit" )[1]
local orbcount = GameGetOrbCountThisRun()
if player == nil then return end
if GlobalsGetValue("hadalmountains") == nil then
    GlobalsSetValue("hadalmountains", "0")
end

local mountaincount = tonumber(GlobalsGetValue("hadalmountains"))

if mountaincount == nil then 
    GlobalsSetValue("hadalmountains", "0")
    mountaincount = 0
end

local orbreq = 0 + (mountaincount * 1.3)

-- destination coords
local dx = x
local dy = y + 300
-- orb

if ModSettingGet( "hadal_difficulty.require_orbs" ) then
    if orbcount >= orbreq then
        if player == nil then return end
        EntitySetTransform( player, dx, dy )
        --SPAWN STEVE TIMER (if player is still in mountain by expiration, spawn steve to evict the player)
        EntityLoad( "mods/hadal/files/biome/temple/steve_timer.xml", dx, dy )
        mountaincount = mountaincount + 1
        local neworbreq = math.ceil(0 + (mountaincount * 1.3))
        GamePrint("You have been to " .. mountaincount .. " Holy Mountains now." )
        GamePrint("You will need " .. tostring(neworbreq) .. " orbs to enter the next Mountain.")
        GlobalsSetValue("hadalmountains", tostring(mountaincount))
    else   
        GamePrint("You do not have enough orbs.")
    end
else
    if player == nil then return end
    EntitySetTransform( player, dx, dy )
    --SPAWN STEVE TIMER (if player is still in mountain by expiration, spawn steve to evict the player)
    EntityLoad( "mods/hadal/files/biome/temple/steve_timer.xml", dx, dy )
    mountaincount = mountaincount + 1
    GamePrint("You have been to " .. mountaincount .. " Holy Mountains now." )
    GlobalsSetValue("hadalmountains", tostring(mountaincount))
end