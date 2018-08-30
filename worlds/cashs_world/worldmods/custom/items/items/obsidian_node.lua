
local Info = {
    Name = "obsidian",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Obsidian",
	tiles = {"custom_obsidian.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'custom:obsidian_shard', 'custom:obsidian_shard', 'custom:obsidian_shard'},
            {'custom:obsidian_shard', 'custom:obsidian_shard', 'custom:obsidian_shard'},
            {'custom:obsidian_shard', 'custom:obsidian_shard', 'custom:obsidian_shard'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
