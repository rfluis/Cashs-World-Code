
local Info = {
    Name = "coal_lump",
    Type = "craft_item",
    Depends_On = "nothing",
}

local Def = {
    description = "Coal Lump",
    inventory_image = "custom_coal_lump.png",
    stack_max = 99,
    groups = {coal = 1, flammable = 1},
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {9},
    Shapeless = {true},
    Formula = {
        {
            "custom:coalblock",
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 40,
}


-- Register this item
RegisterItem(Info, Def, Recipes)
