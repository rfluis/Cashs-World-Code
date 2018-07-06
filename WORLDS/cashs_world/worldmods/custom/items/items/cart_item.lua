
carts:register_rail("custom:rail", {
	description = "Rail",
	tiles = {
		"custom_rail_straight.png", "custom_rail_curved.png",
		"custom_rail_t_junction.png", "custom_rail_crossing.png"
	},
	inventory_image = "custom_rail_straight.png",
	wield_image = "custom_rail_straight.png",
	groups = carts:get_rail_groups(),
}, {})

minetest.register_craft({
	output = "custom:rail 16",
	recipe = {
		{"custom:steel_ingot", "", "custom:steel_ingot"},
		{"custom:steel_ingot", "group:stick", "custom:steel_ingot"},
		{"custom:steel_ingot", "", "custom:steel_ingot"},
	}
})

carts:register_rail("custom:powerrail", {
	description = "Powered rail",
	tiles = {
		"custom_rail_straight_pwr.png", "custom_rail_curved_pwr.png",
		"custom_rail_t_junction_pwr.png", "custom_rail_crossing_pwr.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = 5})

minetest.register_craft({
	output = "custom:powerrail 8",
	recipe = {
		{"custom:steel_ingot", "custom:mese_crystal_fragment", "custom:steel_ingot"},
		{"custom:steel_ingot", "group:stick", "custom:steel_ingot"},
		{"custom:steel_ingot", "custom:mese_crystal_fragment", "custom:steel_ingot"},
	}
})


carts:register_rail("custom:brakerail", {
	description = "Brake rail",
	tiles = {
		"custom_rail_straight_brk.png", "custom_rail_curved_brk.png",
		"custom_rail_t_junction_brk.png", "custom_rail_crossing_brk.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = -3})

minetest.register_craft({
	output = "custom:brakerail 8",
	recipe = {
		{"custom:steel_ingot", "custom:coal_lump", "custom:steel_ingot"},
		{"custom:steel_ingot", "group:stick", "custom:steel_ingot"},
		{"custom:steel_ingot", "custom:coal_lump", "custom:steel_ingot"},
	}
})

-- Support for non-default games
if not default.player_attached then
	default.player_attached = {}
end
