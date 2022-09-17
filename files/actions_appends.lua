local to_insert = {
	{
		id          = "HADAL_CHAINSAW",
		name 		= "$action_chainsaw",
		description = "A good tool for cutting meat. Thats about it.",
		sprite 		= "data/ui_gfx/gun_actions/chainsaw.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/chainsaw_unidentified.png",
		related_projectiles	= {"data/entities/projectiles/deck/chainsaw.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,2,3", -- CHAINSAW
		spawn_probability                 = "1,1,1", -- CHAINSAW
		price = 80,
		mana = 5,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/chainsaw.xml")
			c.fire_rate_wait = c.fire_rate_wait - 20
			if c.fire_rate_wait <= 30 then
				c.fire_rate_wait = 0
			end
			c.spread_degrees = c.spread_degrees + 6.0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10
		end,
	},
}

for k, v in ipairs(to_insert) do
    table.insert(actions, v)
end

function remove_action( action_name )
	local key_to_action = nil
	for key,action in pairs(actions) do
		if( action.id == action_name) then
			key_to_action = key
		end
	end

	if( key_to_action ~= nil ) then
		table.remove(actions, key_to_action)
	end
end

remove_action("BLACK_HOLE_GIGA")
remove_action("CHAINSAW")
