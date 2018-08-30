
local S = protector.intllib


protector.register_trapdoor("custom:protected_trapdoor_steel", {
	description = S("Protected Steel Trapdoor"),
	inventory_image = "custom_trapdoor_steel.png^custom_protector_logo.png",
	wield_image = "custom_trapdoor_steel.png^custom_protector_logo.png",
	tile_front = "custom_trapdoor_steel.png^custom_protector_logo.png",
	tile_side = "custom_trapdoor_steel_side.png",
	groups = {
		snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2,
		unbreakable = 1, --door = 1
	},
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = 'custom:protected_trapdoor_steel',
	recipe = {
		{'custom:bronze_ingot', 'custom:steel_ingot'},
		{'custom:steel_ingot', 'custom:steel_ingot'},
	}
})
minetest.register_craft({
    type = "shapeless",
	output = "custom:protected_trapdoor_steel",
	recipe = {"custom:trapdoor_steel", "custom:copper_ingot"}
})
