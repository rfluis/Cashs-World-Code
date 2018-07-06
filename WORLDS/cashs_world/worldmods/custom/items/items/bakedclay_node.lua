
-- Baked Clay by TenPlus1

local clay = {
	{"white", "White"},
	{"grey", "Grey"},
	{"black", "Black"},
	{"red", "Red"},
	{"yellow", "Yellow"},
	{"green", "Green"},
	{"cyan", "Cyan"},
	{"blue", "Blue"},
	{"magenta", "Magenta"},
	{"orange", "Orange"},
	{"violet", "Violet"},
	{"brown", "Brown"},
	{"pink", "Pink"},
	{"dark_grey", "Dark Grey"},
	{"dark_green", "Dark Green"},
}

for _, clay in pairs(clay) do

	-- node definition

	minetest.register_node("custom:bakedclay_" .. clay[1], {
		description = clay[2] .. " Baked Clay",
		tiles = {"baked_clay_" .. clay[1] ..".png"},
		groups = {cracky = 3, bakedclay = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	-- craft from dye and any baked clay

	minetest.register_craft({
		output = "custom:bakedclay_" .. clay[1] .. " 8",
		recipe = {
			{"group:bakedclay", "group:bakedclay", "group:bakedclay"},
			{"group:bakedclay", "custom:dye_" .. clay[1], "group:bakedclay"},
			{"group:bakedclay", "group:bakedclay", "group:bakedclay"}
		},
	})

	stairs.register_stair_and_slab("bakedclay_".. clay[1], "custom:bakedclay_".. clay[1],
		{cracky = 3},
		{"baked_clay_" .. clay[1] .. ".png"},
		clay[2] .. " Baked Clay Stair",
		clay[2] .. " Baked Clay Slab",
		default.node_sound_stone_defaults())

end

-- cook clay block into white baked clay

minetest.register_craft({
	type = "cooking",
	output = "custom:bakedclay_white",
	recipe = "custom:clay",
})

print ("[MOD] Baked Clay loaded")
