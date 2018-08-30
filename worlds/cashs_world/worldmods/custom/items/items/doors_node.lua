
--************************
-- Items under this line
--************************

-- this hidden node is placed on top of the bottom, and prevents
-- nodes from being placed in the top half of the door.
minetest.register_node("custom:door_hidden_segment", {
	description = "Hidden Door Segment",
	-- can't use airlike otherwise falling nodes will turn to entities
	-- and will be forever stuck until door is removed.
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	-- has to be walkable for falling nodes to stop falling.
	walkable = true,
	pointable = false,
	diggable = false,
	buildable_to = false,
	floodable = false,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	on_blast = function() end,
	tiles = {"custom_doors_hidden_segment.png"},
	-- 1px transparent block inside door hinge near node top.
	nodebox = {
		type = "fixed",
		fixed = {-15/32, 13/32, -15/32, -13/32, 1/2, -13/32},
	},
	-- collision_box needed otherise selection box would be full node size
	collision_box = {
		type = "fixed",
		fixed = {-15/32, 13/32, -15/32, -13/32, 1/2, -13/32},
	},
})

doors.register("door_wood", {
		tiles = {{ name = "custom_door_wood.png", backface_culling = true }},
		description = "Wooden Door",
		inventory_image = "custom_door_wood_inv.png",
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		recipe = {
			{"group:wood", "group:wood"},
			{"group:wood", "group:wood"},
			{"group:wood", "group:wood"},
		}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:door_wood",
	burntime = 14,
})

doors.register("door_steel", {
		tiles = {{name = "custom_door_steel.png", backface_culling = true}},
		description = "Steel Door",
		inventory_image = "custom_door_steel_inv.png",
		protected = true,
		groups = {cracky = 1, level = 2},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "custom_steel_door_open",
		sound_close = "custom_steel_door_close",
		recipe = {
			{"custom:steel_ingot", "custom:steel_ingot"},
			{"custom:steel_ingot", "custom:steel_ingot"},
			{"custom:steel_ingot", "custom:steel_ingot"},
		}
})

doors.register("door_glass", {
		tiles = {"custom_door_glass.png"},
		description = "Glass Door",
		inventory_image = "custom_door_glass_inv.png",
		groups = {cracky=3, oddly_breakable_by_hand=3},
		sounds = default.node_sound_glass_defaults(),
		sound_open = "custom_glass_door_open",
		sound_close = "custom_glass_door_close",
		recipe = {
			{"custom:glass", "custom:glass"},
			{"custom:glass", "custom:glass"},
			{"custom:glass", "custom:glass"},
		}
})

doors.register("door_obsidian_glass", {
		tiles = {"custom_door_obsidian_glass.png"},
		description = "Obsidian Glass Door",
		inventory_image = "custom_door_obsidian_glass_inv.png",
		groups = {cracky=3},
		sounds = default.node_sound_glass_defaults(),
		sound_open = "custom_glass_door_open",
		sound_close = "custom_glass_door_close",
		recipe = {
			{"custom:obsidian_glass", "custom:obsidian_glass"},
			{"custom:obsidian_glass", "custom:obsidian_glass"},
			{"custom:obsidian_glass", "custom:obsidian_glass"},
		},
})

doors.register_trapdoor("custom:trapdoor", {
	description = "Trapdoor",
	inventory_image = "custom_trapdoor.png",
	wield_image = "custom_trapdoor.png",
	tile_front = "custom_trapdoor.png",
	tile_side = "custom_trapdoor_side.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, door = 1},
})
minetest.register_craft({
	output = 'custom:trapdoor 2',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', '', ''},
	}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:trapdoor",
	burntime = 7,
})

doors.register_trapdoor("custom:trapdoor_steel", {
	description = "Steel Trapdoor",
	inventory_image = "custom_trapdoor_steel.png",
	wield_image = "custom_trapdoor_steel.png",
	tile_front = "custom_trapdoor_steel.png",
	tile_side = "custom_trapdoor_steel_side.png",
	protected = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "custom_steel_door_open",
	sound_close = "custom_steel_door_close",
	groups = {cracky = 1, level = 2, door = 1},
})
minetest.register_craft({
	output = 'custom:trapdoor_steel',
	recipe = {
		{'custom:steel_ingot', 'custom:steel_ingot'},
		{'custom:steel_ingot', 'custom:steel_ingot'},
	}
})

doors.register_fencegate("custom:gate_wood", {
	description = "Wooden Fence Gate",
	texture = "custom_wood.png",
	material = "custom:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:gate_wood_closed",
	burntime = 7,
})

doors.register_fencegate("custom:gate_acacia_wood", {
	description = "Acacia Fence Gate",
	texture = "custom_acacia_wood.png",
	material = "custom:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:gate_acacia_wood_closed",
	burntime = 8,
})

doors.register_fencegate("custom:gate_junglewood", {
	description = "Junglewood Fence Gate",
	texture = "custom_junglewood.png",
	material = "custom:junglewood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:gate_junglewood_closed",
	burntime = 9,
})

doors.register_fencegate("custom:gate_pine_wood", {
	description = "Pine Fence Gate",
	texture = "custom_pine_wood.png",
	material = "custom:pine_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:gate_pine_wood_closed",
	burntime = 6,
})

doors.register_fencegate("custom:gate_aspen_wood", {
	description = "Aspen Fence Gate",
	texture = "custom_aspen_wood.png",
	material = "custom:aspen_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:gate_aspen_wood_closed",
	burntime = 5,
})
