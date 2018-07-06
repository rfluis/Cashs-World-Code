
local Info = {
    Name = "fence_pine_wood",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Pine Fence",
	tiles = {"custom_fence_pine_wood.png"},
	inventory_image = "custom_fence_overlay.png^custom_pine_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "custom_fence_overlay.png^custom_pine_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, fence = 1, wood = 1},
	sounds = default.node_sound_wood_defaults(),
		paramtype = "light",
--		drawtype = "fencelike",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
				{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
			connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
				{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
			connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
				{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
			connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
				{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
		},
		connects_to = {"group:fence", "group:wood", "group:tree"},
		sunlight_propagates = true,
		is_ground_content = false,
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {4},
    Shapeless = {false},
    Formula = {
        {
			{ "custom:pine_wood", 'group:stick', "custom:pine_wood" },
			{ "custom:pine_wood", 'group:stick', "custom:pine_wood" },
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 6,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
