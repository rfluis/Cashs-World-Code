
local Info = {
    Name = "mossycobble",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Mossy Cobblestone",
	tiles = {"custom_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
}

local Recipes = {

    Number_Recipes = 0,

    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
