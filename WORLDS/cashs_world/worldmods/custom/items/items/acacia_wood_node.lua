
local Info = {
    Name = "acacia_wood",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Acacia Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"custom_acacia_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
}

local Recipes = {
    Number_Recipes = 2,
    Quantity = {4, 1},
    Shapeless = {true, true},
    Formula = {
        {
            "custom:acacia_tree",
        },
        {
            "custom:acacia_bush_stem"
        }
    },
    Replacements = {nil, nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 8,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
