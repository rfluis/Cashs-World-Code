
local Info = {
    Name = "furnace",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Furnace",
	tiles = {
		"custom_furnace_top.png", "custom_furnace_bottom.png",
		"custom_furnace_side.png", "custom_furnace_side.png",
		"custom_furnace_side.png", "custom_furnace_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	can_dig = furnaces.can_dig,

	on_timer = furnaces.furnace_node_timer,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", furnaces.inactive_formspec)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('fuel', 1)
		inv:set_size('dst', 4)
	end,

	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether furnace can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "src", drops)
		default.get_inventory_drops(pos, "fuel", drops)
		default.get_inventory_drops(pos, "dst", drops)
		drops[#drops+1] = "custom:furnace"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = furnaces.allow_metadata_inventory_put,
	allow_metadata_inventory_move = furnaces.allow_metadata_inventory_move,
	allow_metadata_inventory_take = furnaces.allow_metadata_inventory_take,
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'group:stone', 'group:stone', 'group:stone'},
            {'group:stone', '', 'group:stone'},
            {'group:stone', 'group:stone', 'group:stone'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
