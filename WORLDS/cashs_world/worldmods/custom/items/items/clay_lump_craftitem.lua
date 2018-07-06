
local Info = {
    Name = "clay_lump",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Clay Lump",
    inventory_image = "custom_clay_lump.png",
    stack_max = 99,
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {4},
    Shapeless = {true},
    Formula = {
            {"custom:clay"},
    },
    Replacements = {nil},

    Cooking_Output = "custom:clay_brick",
    Cook_Time = 3,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
