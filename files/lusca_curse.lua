function lusca_curse( activity, entity )
    if GameHasFlagRun( "lusca_dead" ) == true then
        GlobalsSetValue( "lusca_curse", "0" )
        return
    end
    local cursed = false
    local curselevel = tonumber(GlobalsGetValue("luscacurse"))
    if curselevel == nil then
        GlobalsSetValue( "luscacurse", "0" )
        curselevel = 0
    end
    if entity == nil then
        entity = EntityGetWithTag("player_unit")[1]
    end
    local chance = get_chance( activity )
    if chance == nil then return end
    if math.random(1, chance) == 1 then
        cursed = true
    end
    if cursed == true then -- you are cursed
        curselevel = curselevel + 1
        GlobalsSetValue( "luscacurse", tostring(curselevel) )
        announce_cursed( activity, curselevel, entity )
    end
end

function announce_cursed( activity, level, entity )
    GamePrintImportant( "Lusca has cursed you!", "Your " .. activity .. " has caught the attention of Lusca." )
    GamePrint( "Lusca curse level now: " .. level )
    local x, y = EntityGetTransform( entity )
    local child_id = EntityLoad( "data/entities/misc/orb_boss_scream.xml", x, y )
    EntityAddChild( entity, child_id )
end

function get_chance( activity ) -- ty gustavo
    for i, v in ipairs(activities) do 
        local x;
        if v["activity"] == activity then x = v else x = 0 end
        if (x ~= 0) then return x["chance"]
    end
end
end

activities = {
    {
        activity = "wand crafting",
        chance = 100,
    },
    {
        activity = "orb collecting",
        chance = 30,
    },
}
