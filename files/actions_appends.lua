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

remove_action("BLACK_HOLE_BIG")
remove_action("BLACK_HOLE_GIGA")
remove_action("ALL_BLACKHOLES")