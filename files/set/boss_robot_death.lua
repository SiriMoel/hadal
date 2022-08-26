dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/perks/perk.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local entity_id = GetUpdatedEntityID()
	local x, y = EntityGetTransform( entity_id )
	
	EntityLoad("data/entities/projectiles/deck/explosion_giga.xml", x, y)
	
	--perk_spawn( x, y, "MAP" ) -- this perk needs to be vastly edited
    EntityLoad( "data/entities/items/orbs/orb_04.xml", x, y )
	AddFlagPersistent( "miniboss_robot" )
end