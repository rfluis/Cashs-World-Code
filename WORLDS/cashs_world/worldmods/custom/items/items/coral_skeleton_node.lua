
local Info = {
    Name = "coral_skeleton",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Coral Skeleton",
	tiles = {"custom_coral_skeleton.png"},
	groups = {cracky = 3},
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
