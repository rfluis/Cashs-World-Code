
local Info = {
    Name = "obsidianbrick",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Obsidian Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"custom_obsidian_brick.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {4},
    Shapeless = {false},
    Formula = {
        {
            {'custom:obsidian', 'custom:obsidian'},
            {'custom:obsidian', 'custom:obsidian'}
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
