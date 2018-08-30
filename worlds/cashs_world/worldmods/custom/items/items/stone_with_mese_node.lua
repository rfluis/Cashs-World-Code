
local Info = {
    Name = "stone_with_mese",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Mese Ore",
    stack_max = 99,
    groups = {cracky = 1},
    tiles = {"custom_stone.png^custom_mineral_mese.png"},
    drop = "custom:mese_crystal",
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
