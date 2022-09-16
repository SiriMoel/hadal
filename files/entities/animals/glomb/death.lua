dofile_once("data/scripts/lib/utilities.lua")
dofile_once( "data/scripts/game_helpers.lua" )
dofile_once("mods/hadal/files/lusca_curse.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible )
    local lusca = GetUpdatedEntityID()
    local x, y = EntityGetTransform(lusca)
    if GameHasFlagRun("lusca_dead") == true then return end
    GameAddFlagRun("lusca_dead")
    EntityLoad( "data/entities/items/orbs/orb_11.xml", x, y )
    EntityLoad( "data/entities/items/pickup/heart_fullhp.xml",  x, y )
    EntityLoad( "hadal/files/entities/items/throngler/throngler.xml", x, y-30 )
    reset_curse()
end