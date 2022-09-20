function remove_perk( perk_name )
	local key_to_perk = nil
	for key,perk in pairs(perk_list) do
		if( perk.id == perk_name) then
			key_to_perk = key
		end
	end

	if( key_to_perk ~= nil ) then
		table.remove(perk_list, key_to_perk)
	end
end

--immunities
remove_perk("PROTECTION_FIRE")
remove_perk("PROTECTION_EXPLOSION")
remove_perk("PROTECTION_MELEE")
remove_perk("PROTECTION_ELECTRICITY")
remove_perk("PROTECTION_RADIOACTIVITY")

--respawns
remove_perk("RESPAWN")
remove_perk("SAVING_GRACE")

--scuffed immunities 
--[[
remove_perk("EXPLODING_CORPSES")
remove_perk("ELECTRICITY")
remove_perk("BLEED_OIL") 
]]--

--irrelevant in hadal
remove_perk("PEACE_WITH_GODS")
remove_perk("PERKS_LOTTERY")
remove_perk("EXTRA_PERK")

--other
remove_perk("NO_WAND_EDITING")
remove_perk("EDIT_WANDS_EVERYWHERE")
--remove_perk("INVISIBILITY")

local to_insert = {
	{
		id = "HADAL_PROTECTION_FIRE",
		ui_name = "Fire Protection",
		ui_description = "You take 50% less damage from fire.",
		ui_icon = "data/ui_gfx/perk_icons/protection_fire.png",
		perk_icon = "data/items_gfx/perks/protection_fire.png",
		--game_effect = "PROTECTION_FIRE",
		stackable = STACKABLE_YES,
		usable_by_enemies = true,
		func = function( entity_perk_item, entity_who_picked, item_name )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local fire = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "fire" ) )
					fire = fire * 0.5
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "fire", tostring(fire) )
				end
			end
		end,
		func_remove = function( entity_who_picked )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local fire = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "fire" ) )
					fire = fire * 2
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "fire", tostring(fire) )
				end
			end
		end,
	},
	{
		id = "HADAL_PROTECTION_EXPLOSION",
		ui_name = "Explosion Protection",
		ui_description = "You take 50% less damage from explosions.",
		ui_icon = "data/ui_gfx/perk_icons/protection_explosion.png",
		perk_icon = "data/items_gfx/perks/protection_explosion.png",
		stackable = STACKABLE_YES,
		usable_by_enemies = true,
		func = function( entity_perk_item, entity_who_picked, item_name )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local dmg = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "explosion" ) )
					dmg = dmg * 0.5
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "explosion", tostring(dmg) )
				end
			end
		end,
		func_remove = function( entity_who_picked )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local dmg = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "explosion" ) )
					dmg = dmg * 2
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "explosion", tostring(dmg) )
				end
			end
		end,
	},
	{
		id = "HADAL_PROTECTION_MELEE",
		ui_name = "Melee Protection",
		ui_description = "You take 50% less damage from melee.",
		ui_icon = "data/ui_gfx/perk_icons/protection_melee.png",
		perk_icon = "data/items_gfx/perks/protection_melee.png",
		stackable = STACKABLE_YES,
		usable_by_enemies = true,
		func = function( entity_perk_item, entity_who_picked, item_name )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local dmg = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "melee" ) )
					dmg = dmg * 0.5
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "melee", tostring(dmg) )
				end
			end
		end,
		func_remove = function( entity_who_picked )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local dmg = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "melee" ) )
					dmg = dmg * 2
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "melee", tostring(dmg) )
				end
			end
		end,
	},
	{
		id = "HADAL_PROTECTION_ELECTRICITY",
		ui_name = "Electricity Protection",
		ui_description = "You take 50% less damage from electricity.",
		ui_icon = "data/ui_gfx/perk_icons/protection_electricity.png",
		perk_icon = "data/items_gfx/perks/protection_electricity.png",
		stackable = STACKABLE_YES,
		usable_by_enemies = true,
		func = function( entity_perk_item, entity_who_picked, item_name )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local dmg = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "electricity" ) )
					dmg = dmg * 0.5
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "electricity", tostring(dmg) )
				end
			end
		end,
		func_remove = function( entity_who_picked )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local dmg = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "electricity" ) )
					dmg = dmg * 2
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "electricity", tostring(dmg) )
				end
			end
		end,
	},
	--[[{
		id = "HADAL_PROTECTION_RADIOACTIVITY",
		ui_name = "Radioactivity Protection",
		ui_description = "You take 50% less damage from radioactivity.",
		ui_icon = "data/ui_gfx/perk_icons/protection_radioactivity.png",
		perk_icon = "data/items_gfx/perks/protection_radioactivity.png",
		stackable = STACKABLE_YES,
		usable_by_enemies = true,
		func = function( entity_perk_item, entity_who_picked, item_name )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local dmg = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "radioactivity" ) )
					dmg = dmg * 0.5
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "radioactivity", tostring(dmg) )
				end
			end
		end,
		func_remove = function( entity_who_picked )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local dmg = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "radioactivity" ) )
					dmg = dmg * 2
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "radioactivity", tostring(dmg) )
				end
			end
		end,
	},]]--
}

for k,v in ipairs(to_insert) do
	table.insert(perk_list, v)
end