
local Info = {
-- The name of this item. Leave blank if defining the hand.
    Name = "silver_sand",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Silver Sand",
    stack_max = 99,
    groups = {crumbly = 3, falling_node = 1, sand = 1},
    tiles = {"custom_silver_sand.png"},
	sounds = default.node_sound_sand_defaults(),
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "custom:glass",
    Cook_Time = 3,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
