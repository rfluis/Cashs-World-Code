
local Info = {
    Name = "ice",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Ice",
    stack_max = 99,
    groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1},
    tiles = {"custom_ice.png"},
    paramtype = "light",
    is_ground_content = false,
	sounds = default.node_sound_glass_defaults(),
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
