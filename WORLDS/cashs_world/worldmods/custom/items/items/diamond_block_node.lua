
local Info = {
    Name = "diamondblock",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Diamond Block",
	tiles = {"custom_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'custom:diamond', 'custom:diamond', 'custom:diamond'},
            {'custom:diamond', 'custom:diamond', 'custom:diamond'},
            {'custom:diamond', 'custom:diamond', 'custom:diamond'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
