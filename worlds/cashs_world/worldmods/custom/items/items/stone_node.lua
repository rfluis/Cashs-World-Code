
local Info = {
    Name = "stone",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Stone",
	tiles = {"custom_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'custom:cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {
    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
