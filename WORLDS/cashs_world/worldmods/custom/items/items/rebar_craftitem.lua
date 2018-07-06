
local Info = {
    Name = "rebar",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Reinforcing bar used in making concrete",
    inventory_image = "custom_rebar.png",
    tool_capabilities = nil,
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {6},
    Shapeless = {false},
    Formula = {
        {{'','','custom:steel_ingot'},
        {'','custom:steel_ingot',''},
        {'custom:steel_ingot','',''}},
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)

