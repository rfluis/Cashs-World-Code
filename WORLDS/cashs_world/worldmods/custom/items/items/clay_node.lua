
local Info = {
    Name = "clay",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Clay",
    stack_max = 99,
    groups = {crumbly = 3},
    tiles = {"custom_clay.png"},
    drop = 'custom:clay_lump 4',
	sounds = default.node_sound_dirt_defaults(),
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'custom:clay_lump', 'custom:clay_lump'},
            {'custom:clay_lump', 'custom:clay_lump'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
