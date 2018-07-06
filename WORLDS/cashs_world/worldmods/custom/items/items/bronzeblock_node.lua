
local Info = {
    Name = "bronzeblock",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Bronze Block",
	tiles = {"custom_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'custom:bronze_ingot', 'custom:bronze_ingot', 'custom:bronze_ingot'},
            {'custom:bronze_ingot', 'custom:bronze_ingot', 'custom:bronze_ingot'},
            {'custom:bronze_ingot', 'custom:bronze_ingot', 'custom:bronze_ingot'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
