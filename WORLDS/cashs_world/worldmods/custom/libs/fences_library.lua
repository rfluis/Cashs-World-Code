
-- Global namespace for functions
fences = {}

function fences.register_fence(name, Def)

    local Info = {
        Name = name,
        Type = "node",
        Depends_On = "nothing",
    }

    local Recipes = {

        Number_Recipes = 1,
        Quantity = {4},
        Shapeless = {false},
        Formula = {
            {
                { Def.material, 'group:stick', Def.material },
                { Def.material, 'group:stick', Def.material },
            },
        },
        Replacements = {nil},

        Cooking_Output = "",
        Cook_Time = 0,

        Burn_Time = Def.burntime,
    }



	local fence_texture = "custom_fence_overlay.png^" .. Def.texture ..
			"^custom_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
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
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {Def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
--		selection_box = {
--			type = "fixed",
--			fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
--		},
		groups = {},
	}
	-- if not defined in the item definition file,
	-- apply default fields to the Def table
	for k, v in pairs(default_fields) do
		if not Def[k] then
			Def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	Def.groups.fence = 1
    -- Remove fields that will not be recognised during registration
	Def.texture = nil
	Def.material = nil
	Def.burntime = nil

    RegisterItem(Info, Def, Recipes)
end
