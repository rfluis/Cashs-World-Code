
local Info = {
    Name = "truss",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Truss",
    groups = {cracky = 2},
    drawtype = "allfaces",
    tiles = {"custom_truss.png"},
    node_box = {
        fixed = {
            {1/2, -1/2, -1/2, 1/2, 1/2, 1/2},
            {-1/2, 1/2, -1/2, 1/2, 1/2, 1/2},
            {-1/2, -1/2, 1/2, 1/2, 1/2, 1/2},
            {-1/2, -1/2, -1/2, -1/2, 1/2, 1/2},
            {-1/2, -1/2, -1/2, 1/2, -1/2, 1/2},
            {-1/2, -1/2, -1/2, 1/2, 1/2, -1/2}
        }
    },
    selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 1/2, 1/2}
	},

    paramtype = "light",
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {5},
    Shapeless = {false},
    Formula = {
        {{'custom:steel_ingot','','custom:steel_ingot'},
        {'','custom:steel_ingot',''},
        {'custom:steel_ingot','','custom:steel_ingot'}},
    },
    Replacements = {nil},

    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
