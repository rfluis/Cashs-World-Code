
local Info = {
    Name = "sandstone",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Sandstone",
	tiles = {"custom_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'group:sand', 'group:sand'},
            {'group:sand', 'group:sand'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
