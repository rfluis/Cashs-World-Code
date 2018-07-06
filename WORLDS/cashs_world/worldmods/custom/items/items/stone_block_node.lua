
local Info = {
    Name = "stone_block",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Stone Block",
	tiles = {"custom_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {9},
    Shapeless = {false},
    Formula = {
        {
            {'custom:stone', 'custom:stone', 'custom:stone'},
            {'custom:stone', 'custom:stone', 'custom:stone'},
            {'custom:stone', 'custom:stone', 'custom:stone'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
