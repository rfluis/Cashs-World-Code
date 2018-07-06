
local Info = {
    Name = "lava_source",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Lava Source",
    stack_max = 99,
    groups = {lava = 3, liquid = 2, igniter = 1},
    drawtype = "liquid",
    tiles = {
		{
			name = "custom_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name = "custom_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
    paramtype = "light",
    is_ground_content = false,
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquid_renewable = false,
    liquidtype = "source",
    liquid_alternative_flowing = "custom:lava_flowing",
    liquid_alternative_source = "custom:lava_source",
	drop = "",
	liquid_viscosity = 7,
	drowning = 1,
    light_source = default.LIGHT_MAX - 1,
	damage_per_second = 4 * 2,
	on_place = function(itemstack, placer, pointed_thing)
        return;
    end,
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 60,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
