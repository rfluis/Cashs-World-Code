
local Info = {
    Name = "dirt_with_grass_footsteps",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Dirt with Grass and Footsteps",
    stack_max = 99,
    groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
    tiles = {"custom_grass.png^custom_footprint.png", "custom_dirt.png",
		{name = "custom_dirt.png^custom_grass_side.png",
			tileable_vertical = false}},
	drop = 'custom:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "custom_grass_footstep", gain = 0.25},
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
