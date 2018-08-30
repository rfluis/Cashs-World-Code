
local Info = {
    Name = "dirt_with_snow",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Dirt with Snow",
    stack_max = 99,
    groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
    tiles = {"custom_snow.png", "custom_dirt.png",
		{name = "custom_dirt.png^custom_snow_side.png",
			tileable_vertical = false}},
	drop = 'custom:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "custom_snow_footstep", gain = 0.15},
	}),
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
