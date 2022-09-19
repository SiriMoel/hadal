dofile_once("data/scripts/magic/fungal_shift.lua")

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
     -- perk to halve curse chance & perk to double curse chance code here (done)
    if GameHasFlagRun("luscacurse_half") then -- halves chance to be cursed
        chance = chance * 2
    end
    if GameHasFlagRun( "luscacurse_double" ) then -- double chance to be cursed
        chance = math.ceil(chance * 0.5)
    end
    --mod setting for adjusting chance?
    if chance == nil then return end
    local cursenum = math.random(1, chance)
    --GamePrint("CURSE FUNCTION RAN, " .. cursenum) -- testing
    if cursenum == 2 then
        cursed = true
    end
    if cursed == true then -- you are cursed
        curselevel = curselevel + 1
        GlobalsSetValue( "luscacurse", tostring(curselevel) )
        announce_cursed( activity, curselevel, entity )
        curse()
    end
end

function announce_cursed( activity, level, entity )
    local activitytext = string.gsub(activity, "_", " ")
    GamePrintImportant( "The Glomb has cursed you!", "Your " .. activitytext .. " has caught the attention of the Glomb." )
    GamePrint( "Curse level now: " .. tostring(level) )
    local x, y = EntityGetTransform( entity )
    local child_id = EntityLoad( "data/entities/misc/orb_boss_scream.xml", x, y )
    EntityAddChild( entity, child_id )
end

function curse()
    local level = tonumber(GlobalsGetValue("luscacurse"))
    local curse = cursedebuffs[level]
    --if GameHasFlagRun( "lc" .. level ) then return end
    if level > 5 then
        damagemodifiers(1.1)
        changemaxhp(0.9)
        GamePrint("You now permanently take 10% more damage and have lost 10% of your max health.")
    else
        funccurse = curse["func"]
        GamePrint(curse["message"])
        funccurse()
    end
    --GameAddFlagRun( "lc" .. level )
end

function get_chance( activity ) -- ty gustavo
    for i, v in ipairs(activities) do 
        local x;
        if v["activity"] == activity then x = v else x = 0 end
        if (x ~= 0) then return x["chance"]
    end
end
end

cursedebuffs = {
    {
        t = 1,
        message = "You now take 20% more damage.",
        func = function()
            damagemodifiers(1.2)
        end,
    },
    {
        t = 2,
        message = "Your max health has been lowered by 20%.",
        func = function()
            changemaxhp(0.8)
        end,
    },
    {
        t = 3,
        message = "Worms are a fan of you.",
        func = function()
            local player = EntityGetWithTag("player_unit")[1]
            local x, y = EntityGetTransform(player)
            EntityLoad( "data/entities/projectiles/deck/worm_rain.xml", x, y )
            --EntityIngestMaterial( player, CellFactory_GetType("magic_liquid_worm_attractor"), 1000000 )
            LoadGameEffectEntityTo( player, "data/entities/misc/effect_worm_attractor.xml" )
        end,
    },
    {
        t = 4,
        message = "Healing is significantly reduced.",
        func = function()
            local player = EntityGetWithTag("player_unit")[1]
            no_healing()
        end,
    },
    {
        t = 5,
        message = "The world has shifted.",
        func = function()
            local player = EntityGetWithTag("player_unit")[1]
            --EntityIngestMaterial( player, CellFactory_GetType("blood_fungi"), 1000000 ) -- will this work? should i also add a shift function from fungal_shift.lua
            local x, y = EntityGetTransform(player)
            fungal_shift( player, x, y, false )
        end,
    },
}

activities = {
    {
        activity = "wand_crafting",
        chance = 10,
    },
    {
        activity = "orb_collecting",
        chance = 7,
    },
    {
        activity = "creature_killing",
        chance = 95,
    },
}

function reset_curse()
    local player = EntityGetWithTag("player_unit")[1]
    --1
    damagemodifiers(0.8)
    --2
    changemaxhp(1.2)
    --3
    EntityRemoveIngestionStatusEffect( player, "worm_attractor" )
    --4
    yes_healing()
    --5
    --EntityRemoveIngestionStatusEffect( player, "trip" )
end

function damagemodifiers( modifier )
    local player = EntityGetWithTag("player_unit")[1]
    local damagemodels = EntityGetComponent( player, "DamageModelComponent" )
	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
			
			local melee = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "melee" ) )
			local projectile = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "projectile" ) )
			local explosion = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "explosion" ) )
			local electricity = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "electricity" ) )
			local fire = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "fire" ) )
			local drill = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "drill" ) )
			local slice = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "slice" ) )
			local ice = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "ice" ) )
			local healing = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "healing" ) )
			local physics_hit = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "physics_hit" ) )
			local radioactive = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "radioactive" ) )
			local poison = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "poison" ) )

			melee = melee * modifier
			projectile = projectile * modifier
			explosion = explosion * modifier
			electricity = electricity * modifier
			fire = fire * modifier
			drill = drill * modifier
			slice = slice * modifier
			ice = ice * modifier
            --healing = healing * 0.75
            physics_hit = physics_hit * modifier
			radioactive = radioactive * modifier
			poison = poison * modifier

			ComponentObjectSetValue( damagemodel, "damage_multipliers", "melee", tostring(melee) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "projectile", tostring(projectile) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "explosion", tostring(explosion) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "electricity", tostring(electricity) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "fire", tostring(fire) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "drill", tostring(drill) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "slice", tostring(slice) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "ice", tostring(ice) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "healing", tostring(healing) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "physics_hit", tostring(physics_hit) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "radioactive", tostring(radioactive) )
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "poison", tostring(poison) )

		end
	end
end

function changemaxhp( modifier )
    local player = EntityGetWithTag("player_unit")[1]
    local damagemodels = EntityGetComponent( player, "DamageModelComponent" )
	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
			local old_max_hp = tonumber( ComponentGetValue( damagemodel, "max_hp" ) )
			local max_hp = old_max_hp * modifier
				
			local max_hp_cap = tonumber( ComponentGetValue( damagemodel, "max_hp_cap" ) )
			if max_hp_cap > 0 then
				max_hp = math.min( max_hp, max_hp_cap )
			end
				
			local current_hp = tonumber( ComponentGetValue( damagemodel, "hp" ) )
			current_hp = math.min( current_hp + math.abs(max_hp - old_max_hp), max_hp )
				
			ComponentSetValue( damagemodel, "max_hp", max_hp )
			ComponentSetValue( damagemodel, "hp", current_hp )
		end
	end
end

function no_healing()
    local player = EntityGetWithTag("player_unit")[1]
    local damagemodels = EntityGetComponent( player, "DamageModelComponent" )
	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
			local healing = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "healing" ) )
            healing = healing * 0.05
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "healing", tostring(healing) )
		end
	end
end

function yes_healing()
    local player = EntityGetWithTag("player_unit")[1]
    local damagemodels = EntityGetComponent( player, "DamageModelComponent" )
	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
			local healing = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "healing" ) )
            healing = healing * 0 + 1
			ComponentObjectSetValue( damagemodel, "damage_multipliers", "healing", tostring(healing) )
		end
	end
end