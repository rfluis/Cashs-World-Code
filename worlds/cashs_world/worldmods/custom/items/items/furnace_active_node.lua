
local Info = {
    Name = "furnace_active",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Furnace",
	tiles = {
		"custom_furnace_top.png", "custom_furnace_bottom.png",
		"custom_furnace_side.png", "custom_furnace_side.png",
		"custom_furnace_side.png",
		{
			image = "custom_furnace_front_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "custom:furnace",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_timer = furnaces.furnace_node_timer,

	can_dig = furnaces.can_dig,

	allow_metadata_inventory_put = furnaces.allow_metadata_inventory_put,
	allow_metadata_inventory_move = furnaces.allow_metadata_inventory_move,
	allow_metadata_inventory_take = furnaces.allow_metadata_inventory_take,
}

local Recipes = {

    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
