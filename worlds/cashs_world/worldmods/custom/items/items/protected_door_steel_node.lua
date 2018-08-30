
-- This item uses its own library to be registered.
-- It does not use registration_library.lua

local name = "custom:protected_door_steel"

protector.register_door(name, {
	description = S("Protected Steel Door"),
	inventory_image = "custom_doors_steel.png^custom_protector_logo.png",
	groups = {
		snappy = 1, bendy = 2, cracky = 1,
		level = 2, unbreakable = 1, -- door = 1
	},
	tiles_bottom = {"custom_doors_steel_b.png^custom_protector_logo.png", "custom_doors_grey.png"},
	tiles_top = {"custom_doors_steel_a.png", "custom_doors_grey.png"},
	sounds = default.node_sound_wood_defaults(),
	sunlight = false,
})
minetest.register_craft({
	output = "custom:protected_door_steel",
	recipe = {
		{"custom:steel_ingot", "custom:steel_ingot"},
		{"custom:steel_ingot", "custom:bronze_ingot"},
		{"custom:steel_ingot", "custom:steel_ingot"}
	}
})
minetest.register_craft({
	output = "custom:protected_door_steel",
	recipe = {
		{"custom:door_steel", "custom:bronze_ingot"}
	}
})
