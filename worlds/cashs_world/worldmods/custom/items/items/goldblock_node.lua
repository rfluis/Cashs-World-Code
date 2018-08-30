
local Info = {
    Name = "goldblock",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Gold Block",
	tiles = {"custom_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_metal_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'custom:gold_ingot', 'custom:gold_ingot', 'custom:gold_ingot'},
            {'custom:gold_ingot', 'custom:gold_ingot', 'custom:gold_ingot'},
            {'custom:gold_ingot', 'custom:gold_ingot', 'custom:gold_ingot'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
