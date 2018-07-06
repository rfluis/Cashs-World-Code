
local Info = {
    Name = "snowblock",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Snow Block",
	tiles = {"custom_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1},
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
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'custom:snow', 'custom:snow', 'custom:snow'},
            {'custom:snow', 'custom:snow', 'custom:snow'},
            {'custom:snow', 'custom:snow', 'custom:snow'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
