dofile_once("data/scripts/lib/utilities.lua")

items = {

    total_prob = 0,

    {
		prob   		= 0.4,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/hadal/files/entities/items/wandcores/t4.xml"
	},
    {
		prob   		= 0.4,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/hadal/files/entities/items/wandcores/t5.xml"
	},
    {
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/hadal/files/entities/items/wandcores/t6.xml"
	},
    {
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/hadal/files/entities/items/wandcores/_handle.xml"
	},
    {
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/hadal/files/entities/items/wandcores/_brace.xml"
	},

}

g_items = {}
for k, v in pairs(items) do
	g_items[k] = v;
end