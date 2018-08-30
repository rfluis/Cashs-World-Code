
local Info = {
    Name = "mese",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Mese Block",
	tiles = {"custom_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	light_source = 3,
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'custom:mese_crystal', 'custom:mese_crystal', 'custom:mese_crystal'},
            {'custom:mese_crystal', 'custom:mese_crystal', 'custom:mese_crystal'},
            {'custom:mese_crystal', 'custom:mese_crystal', 'custom:mese_crystal'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
