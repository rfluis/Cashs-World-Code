
local Info = {
    Name = "obsidian_shard",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    description = "Obsidian Shard",
    inventory_image = "custom_obsidian_shard.png",
    stack_max = 99,
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {9},
    Shapeless = {true},
    Formula = {
        {
            "custom:obsidian",
        },
    },
    Replacements = {nil},

    Cooking_Output = "custom:obsidian_glass",
    Cook_Time = 3,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
