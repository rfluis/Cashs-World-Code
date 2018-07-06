
local Info = {
    Name = "gold_lump",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Gold Lump",
    inventory_image = "custom_gold_lump.png",
    stack_max = 99,
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "custom:gold_ingot",
    Cook_Time = 3,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
