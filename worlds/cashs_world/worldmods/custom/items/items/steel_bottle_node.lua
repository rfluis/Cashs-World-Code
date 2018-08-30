
local Info = {
    Name = "steel_bottle",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Heavy Steel Bottle (empty)",
	drawtype = "plantlike",
	tiles = {"custom_steel_bottle.png"},
	inventory_image = "custom_steel_bottle.png",
	wield_image = "custom_steel_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {5},
    Shapeless = {false},
    Formula = {
        {
		{"custom:steel_ingot", "", "custom:steel_ingot"},
		{"custom:steel_ingot", "", "custom:steel_ingot"},
		{"", "custom:steel_ingot", ""}
        },
    },

    Replacements = {nil},

    Cooking_Output = "custom:steel_ingot 4",
    Cook_Time = 3,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
