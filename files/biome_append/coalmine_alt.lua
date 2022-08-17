dofile_once("data/scripts/lib/utilities.lua")

items = {
    
    total_prob = 0,

    {
		prob   		= 0.7,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/hadal/files/entities/items/wandcores/t1.xml"
	},
    {
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/hadal/files/entities/items/wandcores/t2.xml"
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