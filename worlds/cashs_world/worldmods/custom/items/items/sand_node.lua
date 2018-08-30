
local Info = {
    Name = "sand",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Sand",
    stack_max = 99,
    groups = {crumbly = 3, falling_node = 1, sand = 1},
    tiles = {"custom_sand.png"},
	sounds = default.node_sound_sand_defaults(),
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {4},
    Shapeless = {true},
    Formula = {
        {
            'custom:sandstone',
        },
    },
    Replacements = {nil},

    Cooking_Output = "custom:glass",
    Cook_Time = 3,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
