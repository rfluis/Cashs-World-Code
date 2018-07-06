
local S = protector.intllib


-- Protected Wooden Trapdoor
protector.register_trapdoor("custom:protected_trapdoor", {
	description = S("Protected Trapdoor"),
	inventory_image = "custom_trapdoor.png^custom_protector_logo.png",
	wield_image = "custom_trapdoor.png^custom_protector_logo.png",
	tile_front = "custom_trapdoor.png^custom_protector_logo.png",
	tile_side = "custom_trapdoor_side.png",
	groups = {
		snappy = 1, choppy = 2, oddly_breakable_by_hand = 2,
		unbreakable = 1, --door = 1
	},
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = 'custom:trapdoor 2',
	recipe = {
		{'group:wood', 'custom:bronze_ingot', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', '', ''},
	}
})
minetest.register_craft({
	output = "custom:protected_trapdoor",
	recipe = {
		{"custom:trapdoor", "custom:bronze_ingot"}
	}
})
