
local Info = {
    Name = "paper",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
	description = "Paper",
	inventory_image = "custom_paper.png",
	groups = {flammable = 3},
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
		{
            {'custom:papyrus', 'custom:papyrus', 'custom:papyrus'}
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 1,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
