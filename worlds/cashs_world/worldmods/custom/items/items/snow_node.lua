
local Info = {
    Name = "snow",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Snow",
    inventory_Image = "custom_snowball.png",
    wield_image = "custom_snowball.png",
    stack_max = 99,
    groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1},
    drawtype = "nodebox",
    tiles = {"custom_snow.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
    paramtype = "light",

    buildable_to = true,
    floodable = true,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "custom_snow_footstep", gain = 0.15},
		dug = {name = "custom_snow_footstep", gain = 0.2},
		dig = {name = "custom_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "custom:dirt_with_grass" then
			minetest.set_node(pos, {name = "custom:dirt_with_snow"})
		end
	end,
}

local Recipes = {

    Number_Recipes = 1,
    --Quantity is how many of this item is created by using the specified recipe
    Quantity = {9},
    Shapeless = {true},
    Formula = {
        {
            'custom:snowblock',
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
