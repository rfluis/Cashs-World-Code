
local Info = {
    Name = "obsidian_block",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Obsidian Block",
	tiles = {"custom_obsidian_block.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {9},
    Shapeless = {false},
    Formula = {
        {
            {'custom:obsidian', 'custom:obsidian', 'custom:obsidian'},
            {'custom:obsidian', 'custom:obsidian', 'custom:obsidian'},
            {'custom:obsidian', 'custom:obsidian', 'custom:obsidian'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
