
local Info = {
    Name = "coral_brown",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Brown Coral",
	tiles = {"custom_coral_brown.png"},
	groups = {cracky = 3},
	drop = "custom:coral_skeleton",
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
