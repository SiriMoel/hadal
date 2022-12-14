-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/lib/utilities.lua")
dofile( "data/scripts/gun/gun_actions.lua" )
dofile( "mods/hadal/files/entities/items/templewands/_.lua" )
dofile( "data/scripts/perks/perk.lua" )

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff00b665, "portal" )
RegisterSpawnFunction( 0xff10822d, "spawn_workshop" )
RegisterSpawnFunction( 0xff5a822d, "spawn_workshop_extra" )
RegisterSpawnFunction( 0xff6d934c, "spawn_hp" )
RegisterSpawnFunction( 0xffc1b0ff, "hadal_item" )
RegisterSpawnFunction( 0xffffb27f, "hwand" )
RegisterSpawnFunction( 0xff80FF5A, "spawn_vines" )
RegisterSpawnFunction( 0xffff5a0a, "spawn_perk" )
RegisterSpawnFunction( 0xffff00dc, "portal_end" )

g_vines =
{
	total_prob = 0,
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
	{
		prob   		= 0.4,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/verlet_chains/vines/verlet_vine.xml"
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/verlet_chains/vines/verlet_vine_long.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/verlet_chains/vines/verlet_vine_short.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/verlet_chains/vines/verlet_vine_shorter.xml"
	},
}

function spawn_vines(x, y)
	spawn(g_vines,x+5,y+5)
end

function init( x, y, w, h )
	LoadPixelScene( "mods/hadal/files/biome/temple_end/temple_top.png", "mods/hadal/files/biome/temple_end/temple_top_visual.png", x, y-40, "", true )

	LoadPixelScene( "mods/hadal/files/biome/temple_end/temple.png", "mods/hadal/files/biome/temple_end/temple_visual.png", x, y-40+300, "mods/hadal/files/biome/temple_end/temple_background.png", true )
end

function portal( x, y )
    EntityLoad( "mods/hadal/files/biome/temple_end/portal.xml", x, y )
end

function portal_end( x, y )
    EntityLoad( "mods/hadal/files/biome/temple_end/portal_end.xml", x, y )
end

function spawn_workshop( x, y )
	EntityLoad( "data/entities/buildings/workshop.xml", x, y )
end

function spawn_workshop_extra( x, y )
	EntityLoad( "data/entities/buildings/workshop_allow_mods.xml", x, y )
end

function spawn_hp( x, y )
	EntityLoad( "data/entities/items/pickup/heart_fullhp_temple.xml", x-16, y )
	EntityLoad( "data/entities/items/pickup/spell_refresh.xml", x+16, y )
end

function hwand( x, y )
	local wandnumber = math.random(1, #hwands)
	local wand = hwands[wandnumber]

	EntityLoad( wand, x, y )
end

function spawn_perk( x, y )
	SetRandomSeed( x, y )
	perk_spawn_random( x, y )
end

function hadal_item( x, y )
	local mcount = tonumber(GlobalsGetValue("hadalmountains")) -- mountain count
	if mcount == nil then 
		mcount = 0 
	end
	SetRandomSeed( x, y )
	local level = mcount + 1
	local is_stealable = false

	local item = ""
	local cardcost = 0

	item = GetRandomAction( x, y, level, 0 )

	for i,thisitem in ipairs( actions ) do
		if ( string.lower( thisitem.id ) == string.lower( item ) ) then
			price = math.max(math.floor( ( (thisitem.price * 0.30) + (70 * level) ) / 10 ) * 10, 10)
			cardcost = price
			
			if ( thisitem.spawn_requires_flag ~= nil ) then
				local flag = thisitem.spawn_requires_flag
				
				if ( HasFlagPersistent( flag ) == false ) then
					print( "Trying to spawn " .. tostring( thisitem.id ) .. " even though flag " .. tostring( flag ) .. " not set!!" )
				end
			end
		end
	end

	if level >= 6 then
		price = price * 5
		cardcost = cardcost * 5
	end

	local eid = CreateItemActionEntity( item, x, y )

	local offsetx = 6
	local text = tostring(cardcost)
	local textwidth = 0
	
	for i=1,#text do
		local l = string.sub( text, i, i )
		
		if ( l ~= "1" ) then
			textwidth = textwidth + 6
		else
			textwidth = textwidth + 3
		end
	end
	
	offsetx = textwidth * 0.5 - 0.5

	EntityAddComponent( eid, "SpriteComponent", { 
		_tags="shop_cost,enabled_in_world",
		image_file="data/fonts/font_pixel_white.xml", 
		is_text_sprite="1", 
		offset_x=tostring(offsetx), 
		offset_y="25", 
		update_transform="1" ,
		update_transform_rotation="0",
		text=tostring(cardcost),
		z_index="-1",
		} )

	local stealable_value = "0"
	if( is_stealable ) then 
		stealable_value = "1"
	end
	
	EntityAddComponent( eid, "ItemCostComponent", { 
		_tags="shop_cost,enabled_in_world", 
		cost=cardcost,
		stealable=stealable_value
	} )
		
	EntityAddComponent( eid, "LuaComponent", { 
		script_item_picked_up="data/scripts/items/shop_effect.lua",
	} )
end