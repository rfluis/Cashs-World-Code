
local Info = {
    Name = "obsidian_glass",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Obsidian Glass",
    stack_max = 99,
    groups = {cracky = 3},
    drawtype = "glasslike_framed_optional",
    tiles = {"custom_obsidian_glass.png", "custom_obsidian_glass_detail.png"},
    paramtype = "light",
    is_ground_content = false,
    sunlight_propagates = true,
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
