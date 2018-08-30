
local Info = {
    Name = "ladder_wood",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Wooden Ladder",
	drawtype = "signlike",
	tiles = {"custom_ladder_wood.png"},
	inventory_image = "custom_ladder_wood.png",
	wield_image = "custom_ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {3},
    Shapeless = {false},
    Formula = {
        {
		{'group:stick', '', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', '', 'group:stick'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 2,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
