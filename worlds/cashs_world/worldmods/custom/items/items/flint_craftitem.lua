
local Info = {
    Name = "flint",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
	description = "Flint",
	inventory_image = "custom_flint.png",
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
