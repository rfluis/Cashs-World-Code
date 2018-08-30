
local Info = {
    Name = "coalblock",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Coal Block",
    stack_max = 99,
    groups = {cracky = 3},
    tiles = {"custom_coal_block.png"},
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'custom:coal_lump', 'custom:coal_lump', 'custom:coal_lump'},
            {'custom:coal_lump', 'custom:coal_lump', 'custom:coal_lump'},
            {'custom:coal_lump', 'custom:coal_lump', 'custom:coal_lump'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 370,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
