
local Info = {
    Name = "water_flowing",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Flowing Water",
    stack_max = 99,
    groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
    drawtype = "flowingliquid",
    tiles = {"custom_water.png"},
	special_tiles = {
		{
			name = "custom_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "custom_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
    paramtype = "light",
    paramtype2 = "flowingliquid",
    is_ground_content = false,
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquidtype = "flowing",
    liquid_alternative_flowing = "custom:water_flowing",
    liquid_alternative_source = "custom:water_source",
	drop = "",
    liquid_viscosity = 1,
    drowning = 1,
	sounds = default.node_sound_water_defaults(),
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
