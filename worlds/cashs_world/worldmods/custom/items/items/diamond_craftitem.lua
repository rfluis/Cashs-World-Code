
local Info = {
    Name = "diamond",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Diamond",
    inventory_image = "custom_diamond.png",
    stack_max = 99,
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {9},
    Shapeless = {true},
    Formula = {
        {
            "custom:diamondblock",
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
