
local Info = {
    Name = "mese_crystal_fragment",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Mese Crystal Fragment",
    inventory_image = "custom_mese_crystal_fragment.png",
    stack_max = 99,
}

local Recipes = {

    Number_Recipes = 1,

    Quantity = {9},
    Shapeless = {true},
    Formula = {
        {
            "custom:mese_crystal",
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
