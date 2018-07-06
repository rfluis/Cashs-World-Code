
local S = protector.intllib

local name = "custom:protected_door_wood"

protector.register_door(name, {
    description = S("Protected Wooden Door"),
    inventory_image = "custom_doors_wood.png^custom_protector_logo.png",
    groups = {
        snappy = 1, choppy = 2, oddly_breakable_by_hand = 2,
        unbreakable = 1, --door = 1
    },
    tiles_bottom = {"custom_doors_wood_b.png^custom_protector_logo.png", "custom_doors_brown.png"},
    tiles_top = {"custom_doors_wood_a.png", "custom_doors_brown.png"},
    sounds = default.node_sound_wood_defaults(),
    sunlight = false,
})
minetest.register_craft({
	output = "custom:protected_door_wood",
	recipe = {
		{"group:wood", "group:wood"},
		{"group:wood", "custom:bronze_ingot"},
		{"group:wood", "group:wood"}
	}
})
minetest.register_craft({
	output = "custom:protected_door_wood",
	recipe = {
		{"custom:door_wood", "custom:bronze_ingot"}
	}
})
