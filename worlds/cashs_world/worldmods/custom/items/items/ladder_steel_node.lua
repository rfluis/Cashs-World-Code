
local Info = {
    Name = "ladder_steel",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Steel Ladder",
	drawtype = "signlike",
	tiles = {"custom_ladder_steel.png"},
	inventory_image = "custom_ladder_steel.png",
	wield_image = "custom_ladder_steel.png",
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
	groups = {cracky = 2},
	sounds = default.node_sound_metal_defaults(),
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {5},
    Shapeless = {false},
    Formula = {
        {
            {'custom:steel_ingot', '', 'custom:steel_ingot'},
            {'custom:steel_ingot', 'custom:steel_ingot', 'custom:steel_ingot'},
            {'custom:steel_ingot', '', 'custom:steel_ingot'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
