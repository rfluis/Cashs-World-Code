
local Info = {
    Name = "bronze_ingot",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Bronze Ingot",
    inventory_image = "custom_bronze_ingot.png",
    wield_image = "",
    wield_scale = {x=1,y=1,z=1},
    stack_max = 99,
    range = 4.0,
    groups = {},

    tool_capabilities = nil,

    node_placement_prediction = nil,
    usable = false,
    liquids_pointable = false,
}

local Recipes = {

    Number_Recipes = 2,
    Quantity = {1, 9},
    Shapeless = {true, true},
    Formula = {
        {
            "custom:steel_ingot", "custom:copper_ingot",
        },
        {
            "custom:bronzeblock",
        },
    },
    Replacements = {nil, nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
