
local Info = {
    Name = "brick",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Brick Block",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"custom_brick.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
		{'custom:clay_brick', 'custom:clay_brick'},
		{'custom:clay_brick', 'custom:clay_brick'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
