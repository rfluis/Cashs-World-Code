
local Info = {
-- The name of this item. Leave blank if defining the hand.
    Name = "stone_with_diamond",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Diamond Ore",
    stack_max = 99,
    groups = {cracky = 1},
    tiles = {"custom_stone.png^custom_mineral_diamond.png"},
	drop = "custom:diamond",
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
