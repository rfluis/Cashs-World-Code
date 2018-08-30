
local Info = {
    Name = "glass_fragments",
    Type = "craftitem",
    Depends_On = "nothing",
}

local Def = {
	description = "Pile of Glass Fragments",
	inventory_image = "custom_glass_fragments.png",
}

local Recipes = {
    Number_Recipes = 2,
    Quantity = {1, 1},
    Shapeless = {true, true},
    Formula = {
        {
		"custom:glass_bottle",
		"custom:glass_bottle",
        },
        {
		"custom:drinking_glass",
		"custom:drinking_glass",
        },
    },
    Replacements = {nil, nil},

    Cooking_Output = "custom:glass",
    Cook_Time = 3,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
