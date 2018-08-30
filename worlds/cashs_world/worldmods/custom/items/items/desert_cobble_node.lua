
local Info = {
    Name = "desert_cobble",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Desert Cobblestone",
	tiles = {"custom_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {
    Number_Recipes = 0,

    Cooking_Output = "custom:desert_stone",
    Cook_Time = 3,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
