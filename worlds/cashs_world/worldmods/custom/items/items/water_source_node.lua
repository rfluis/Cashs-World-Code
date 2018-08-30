
local Info = {
    Name = "water_source",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Water Source",
    stack_max = 99,
    groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
    drawtype = "liquid",
    tiles = {
        {
			name = "custom_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
    },
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "custom_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
    paramtype = "light",

    is_ground_content = false,
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquidtype = "source",
    liquid_alternative_flowing = "custom:water_flowing",
    liquid_alternative_source = "custom:water_source",
	drop = "",
    liquid_viscosity = 1,
    drowning = 1,
	sounds = default.node_sound_water_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
        return ;
	end,

}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
