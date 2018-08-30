
local Info = {
    Name = "desert_stonebrick",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Desert Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"custom_desert_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {4},
    Shapeless = {false},
    Formula = {
        {
            {'custom:desert_stone', 'custom:desert_stone'},
            {'custom:desert_stone', 'custom:desert_stone'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
