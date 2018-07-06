
local Info = {
    Name = "clay_brick",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Clay Brick",
    inventory_image = "custom_clay_brick.png",
    stack_max = 99,
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {3},
    Shapeless = {true},
    Formula = {
        {
           "custom:brick",
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
