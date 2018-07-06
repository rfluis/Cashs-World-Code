
local Info = {
    Name = "glass_bottle",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Glass Bottle (empty)",
	drawtype = "plantlike",
	tiles = {"custom_glass_bottle.png"},
	inventory_image = "custom_glass_bottle.png",
	wield_image = "custom_glass_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {10},
    Shapeless = {false},
    Formula = {
        {
		{"custom:glass", "", "custom:glass"},
		{"custom:glass", "", "custom:glass"},
		{"", "custom:glass", ""}
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
