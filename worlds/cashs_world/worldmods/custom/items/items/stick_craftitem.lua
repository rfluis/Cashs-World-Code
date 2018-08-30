
local Info = {
    Name = "stick",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
	description = "Stick",
	inventory_image = "custom_stick.png",
	groups = {stick = 1, flammable = 2},
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {4},
    Shapeless = {true},
    Formula = {
		{'group:wood'},
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 1,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
