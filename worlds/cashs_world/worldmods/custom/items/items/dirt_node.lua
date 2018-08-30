
local Info = {
-- The name of this item. Leave blank if defining the hand.
    Name = "dirt",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Dirt",
    stack_max = 99,
    groups = {crumbly = 3, soil = 1},
    tiles = {"custom_dirt.png"},
	sounds = default.node_sound_dirt_defaults(),
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
