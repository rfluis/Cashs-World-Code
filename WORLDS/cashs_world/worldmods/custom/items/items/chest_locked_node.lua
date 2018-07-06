
local Info = {
    Name = "chest_locked",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Locked Chest",
	tiles = {"custom_chest_top.png", "custom_chest_top.png", "custom_chest_side.png",
		"custom_chest_side.png", "custom_chest_side.png", "custom_chest_lock.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Locked Chest (owned by " ..
				meta:get_string("owner") .. ")")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8 * 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and chests.has_locked_chest_privilege(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not chests.has_locked_chest_privilege(meta, player) then
			return 0
		end
		return count
	end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not chests.has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not chests.has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to locked chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes " .. stack:get_name()  ..
			" from locked chest at " .. minetest.pos_to_string(pos))
	end,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		if chests.has_locked_chest_privilege(meta, clicker) then
			minetest.show_formspec(
				clicker:get_player_name(),
				"custom:chest_locked",
				chests.get_locked_chest_formspec(pos)
			)
		end
		return itemstack
	end,
	on_blast = function() end,
	on_key_use = function(pos, player)
		local secret = minetest.get_meta(pos):get_string("key_lock_secret")
		local itemstack = player:get_wielded_item()
		local key_meta = minetest.parse_json(itemstack:get_metadata())

		if secret ~= key_meta.secret then
			return
		end

		minetest.show_formspec(
			player:get_player_name(),
			"custom:chest_locked",
			chests.get_locked_chest_formspec(pos)
		)
	end,
	on_skeleton_key_use = function(pos, player, newsecret)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local name = player:get_player_name()

		-- verify placer is owner of lockable chest
		if owner ~= name then
			minetest.record_protection_violation(pos, name)
			minetest.chat_send_player(name, "You do not own this chest.")
			return nil
		end

		local secret = meta:get_string("key_lock_secret")
		if secret == "" then
			secret = newsecret
			meta:set_string("key_lock_secret", secret)
		end

		return secret, "a locked chest", owner
	end,
}

local Recipes = {

    Number_Recipes = 2,
    Quantity = {1, 1},
    Shapeless = {true, false},
    Formula = {
        {
            "custom:chest", "custom:steel_ingot",
        },
        {
            {'group:wood', 'group:wood', 'group:wood'},
            {'group:wood', 'custom:steel_ingot', 'group:wood'},
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
