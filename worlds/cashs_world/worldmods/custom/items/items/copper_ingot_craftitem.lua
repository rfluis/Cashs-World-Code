
local Info = {
    Name = "copper_ingot",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Copper Ingot",
    inventory_image = "custom_copper_ingot.png",
    Stack_max = 99,
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {9},
    Shapeless = {true},
    Formula = {
        {
            "custom:copperblock",
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
