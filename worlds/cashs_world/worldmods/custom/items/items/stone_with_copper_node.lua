
local Info = {
    Name = "stone_with_copper",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Copper Ore",
    stack_max = 99,
    groups = {cracky = 2},
    tiles = {"custom_stone.png^custom_mineral_copper.png"},

    drop = 'custom:copper_lump',
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
