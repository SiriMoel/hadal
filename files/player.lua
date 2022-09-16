dofile_once("data/scripts/lib/utilities.lua")

local player = GetUpdatedEntityID()
local x, y = EntityGetTransform(player)
local radius = 300
local targets = EntityGetInRadius(x, y, radius)

if targets ~= nil then
    for i,entity in ipairs(targets) do
        if EntityHasTag(entity, "hadalanimalinit") ~= true then
            local child = EntityLoad("mods/hadal/misc/hadalanimaleffects.xml", x, y)
            EntityAddChild(entity, child)
            EntityAddTag(entity, "hadalanimalinit")
            if EntityGetName(entity) ~= "The Glomb" or EntityGetName(entity) ~= "$animal_boss_robot" then
                EntitySetName( entity, "Fylgja" )
            end
        end
    end
end