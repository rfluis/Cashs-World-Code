local function add_ore(modname, description, mineral_name, oredef)
	local img_base = modname .. "_" .. mineral_name
	local toolimg_base = modname .. "_tool_"..mineral_name
	local tool_base = modname .. ":"
	local tool_post = "_" .. mineral_name
	local item_base = tool_base .. mineral_name
	local ingot = item_base .. "_ingot"
	local lump_item = item_base .. "_lump"
	local ingotcraft = ingot

	if oredef.makes.ore then
		minetest.register_node(modname .. ":mineral_" .. mineral_name, {
			description = S("%s Ore"):format(S(description)),
			tiles = {"default_stone.png^" .. modname .. "_mineral_" .. mineral_name .. ".png"},
			groups = {cracky = 3},
			sounds = default_stone_sounds,
			drop = lump_item
		})
	end
end

	oredef.oredef.ore_type = "scatter"
	oredef.oredef.ore = modname .. ":mineral_" .. mineral_name
	oredef.oredef.wherein = "default:stone"
	
	minetest.register_ore(oredef.oredef)
	
