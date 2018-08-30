-- Fancy shaped bed

beds.register_bed("custom:fancy_bed", {
	description = "Fancy Bed",
	inventory_image = "custom_bed_fancy.png",
	wield_image = "custom_bed_fancy.png",
	tiles = {
		bottom = {
			"custom_bed_top1.png",
			"custom_wood.png",
			"custom_bed_side1.png",
			"custom_bed_side1.png^[transformFX",
			"custom_wood.png",
			"custom_bed_foot.png",
		},
		top = {
			"custom_bed_top2.png",
			"custom_wood.png",
			"custom_bed_side2.png",
			"custom_bed_side2.png^[transformFX",
			"custom_bed_head.png",
			"custom_wood.png",
		}
	},
	nodebox = {
		bottom = {
			{-0.5, -0.5, -0.5, -0.375, -0.065, -0.4375},
			{0.375, -0.5, -0.5, 0.5, -0.065, -0.4375},
			{-0.5, -0.375, -0.5, 0.5, -0.125, -0.4375},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.0625, 0.5},
		},
		top = {
			{-0.5, -0.5, 0.4375, -0.375, 0.1875, 0.5},
			{0.375, -0.5, 0.4375, 0.5, 0.1875, 0.5},
			{-0.5, 0, 0.4375, 0.5, 0.125, 0.5},
			{-0.5, -0.375, 0.4375, 0.5, -0.125, 0.5},
			{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
			{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
			{-0.4375, -0.3125, -0.5, 0.4375, -0.0625, 0.4375},
		}
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"", "", "group:stick"},
		{"custom:wool_red", "custom:wool_red", "custom:wool_white"},
		{"group:wood", "group:wood", "group:wood"},
	},
})

-- Simple shaped bed

beds.register_bed("custom:bed", {
	description = "Simple Bed",
	inventory_image = "custom_bed.png",
	wield_image = "custom_bed.png",
	tiles = {
		bottom = {
			"custom_bed_top_bottom.png^[transformR90",
			"custom_wood.png",
			"custom_bed_side_bottom_r.png",
			"custom_bed_side_bottom_r.png^[transformfx",
			"custom_bed_transparent.png",
			"custom_bed_side_bottom.png"
		},
		top = {
			"custom_bed_top_top.png^[transformR90",
			"custom_wood.png",
			"custom_bed_side_top_r.png",
			"custom_bed_side_top_r.png^[transformfx",
			"custom_bed_side_top.png",
			"custom_bed_transparent.png",
		}
	},
	nodebox = {
		bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
		top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"custom:wool_red", "custom:wool_red", "custom:wool_white"},
		{"group:wood", "group:wood", "group:wood"}
	},
})


-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "custom:fancy_bed_bottom",
	burntime = 13,
})

minetest.register_craft({
	type = "fuel",
	recipe = "custom:bed_bottom",
	burntime = 12,
})
