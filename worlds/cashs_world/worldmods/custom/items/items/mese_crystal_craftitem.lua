
local Info = {
    Name = "mese_crystal",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Mese Crystal",
    inventory_image = "custom_mese_crystal.png",
    stack_max = 99,
}

local Recipes = {

    Number_Recipes = 2,

    Quantity = {9, 1},
    Shapeless = {true, false},
    Formula = {
        {
            "custom:mese",
        },
        {
            {"custom:mese_crystal_fragment", "custom:mese_crystal_fragment", "custom:mese_crystal_fragment"},
            {"custom:mese_crystal_fragment", "custom:mese_crystal_fragment", "custom:mese_crystal_fragment"},
            {"custom:mese_crystal_fragment", "custom:mese_crystal_fragment", "custom:mese_crystal_fragment"},
        },
    },
    Replacements = {nil, nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
