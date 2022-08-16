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

remove_perk("INVISIBILITY")
remove_perk("PROTECTION_FIRE")
remove_perk("PROTECTION_EXPLOSION")
remove_perk("PROTECTION_MELEE")
remove_perk("PROTECTION_ELECTRICITY")
remove_perk("PROTECTION_RADIOACTIVITY")
remove_perk("RESPAWN")
remove_perk("SAVING_GRACE")
remove_perk("EXPLODING_CORPSES")
remove_perk("ELECTRICITY")
remove_perk("PEACE_WITH_GODS")
remove_perk("BREATH_UNDERWATER")
