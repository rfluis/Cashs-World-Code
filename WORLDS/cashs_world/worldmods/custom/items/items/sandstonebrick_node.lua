
local Info = {
    Name = "sandstonebrick",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"custom_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {4},
    Shapeless = {false},
    Formula = {
        {
            {'custom:sandstone', 'custom:sandstone'},
            {'custom:sandstone', 'custom:sandstone'}
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
