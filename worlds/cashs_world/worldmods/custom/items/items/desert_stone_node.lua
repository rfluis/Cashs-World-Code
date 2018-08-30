
local Info = {
    Name = "desert_stone",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Desert Stone",
	tiles = {"custom_desert_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'custom:desert_cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {true},
    Formula = {
        {
            "custom:desert_cobble",
        },

    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
