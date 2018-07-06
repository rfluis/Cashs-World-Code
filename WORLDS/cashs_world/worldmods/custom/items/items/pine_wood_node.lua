
local Info = {
    Name = "pine_wood",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Pine Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"custom_pine_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {4},
    Shapeless = {true},
    Formula = {
        {
            "custom:pine_tree",
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 6,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
