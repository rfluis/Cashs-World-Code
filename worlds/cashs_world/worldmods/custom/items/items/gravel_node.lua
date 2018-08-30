
local Info = {
    Name = "gravel",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Gravel",
    stack_max = 99,
    groups = {crumbly = 2, falling_node = 1},
    tiles = {"custom_gravel.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {'custom:flint'}, rarity = 16},
			{items = {'custom:gravel'}}
		}
	},
	sounds = default.node_sound_gravel_defaults(),
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
