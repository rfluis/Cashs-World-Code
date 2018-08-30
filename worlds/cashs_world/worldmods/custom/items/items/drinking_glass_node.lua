
local Info = {
    Name = "drinking_glass",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Drinking Glass (empty)",
	drawtype = "plantlike",
	tiles = {"custom_drinking_glass.png"},
	inventory_image = "custom_drinking_glass_inv.png",
	wield_image = "custom_drinking_glass.png",
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
    Quantity = {14},
    Shapeless = {false},
    Formula = {
		{
            {"custom:glass", "", "custom:glass"},
            {"custom:glass", "", "custom:glass"},
            {"custom:glass", "custom:glass", "custom:glass"}
		},
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
