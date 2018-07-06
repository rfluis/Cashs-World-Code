
local Info = {
    Name = "cloud",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Cloud",
	tiles = {"custom_cloud.png"},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
	groups = {not_in_creative_inventory = 1},
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
