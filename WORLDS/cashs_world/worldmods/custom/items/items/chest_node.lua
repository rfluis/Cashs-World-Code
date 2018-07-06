
local Info = {
    Name = "chest",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Chest",
	tiles = {"custom_chest_top.png", "custom_chest_top.png", "custom_chest_side.png",
		"custom_chest_side.png", "custom_chest_side.png", "custom_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", chests.chest_formspec)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from chest at " .. minetest.pos_to_string(pos))
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "main", drops)
		drops[#drops+1] = "custom:chest"
		minetest.remove_node(pos)
		return drops
	end,
}

local Recipes = {

    Number_Recipes = 2,
    Quantity = {1, 1},
    Shapeless = {true, false},
    Formula = {
        {
            'custom:chest_locked',
        },
        {
            {'group:wood', 'group:wood', 'group:wood'},
            {'group:wood', '', 'group:wood'},
            {'group:wood', 'group:wood', 'group:wood'},
        },
    },
    Replacements = {nil, nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 30,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
