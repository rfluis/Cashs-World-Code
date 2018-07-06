
local Info = {
    Name = "junglewood",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Junglewood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"custom_junglewood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {4},
    Shapeless = {true},
    Formula = {
        {
            'custom:jungletree',
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 9,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
