
local S = protector.intllib


-- Protected Chest
minetest.register_node("custom:protected_chest", {
	description = S("Protected Chest"),
	tiles = {
		"custom_chest_top.png", "custom_chest_top.png",
		"custom_chest_side.png", "custom_chest_side.png",
		"custom_chest_side.png", "custom_chest_front.png^custom_protector_logo.png"
	},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, unbreakable = 1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)

		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		meta:set_string("infotext", S("Protected Chest"))
		meta:set_string("name", "")
		inv:set_size("main", 8 * 4)
	end,

	can_dig = function(pos,player)

		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		if inv:is_empty("main") then

			if not minetest.is_protected(pos, player:get_player_name()) then
				return true
			end
		end
	end,

	on_metadata_inventory_put = function(pos, listname, index, stack, player)

		minetest.log("action", S("@1 moves stuff to protected chest at @2",
			player:get_player_name(), minetest.pos_to_string(pos)))
	end,

	on_metadata_inventory_take = function(pos, listname, index, stack, player)

		minetest.log("action", S("@1 takes stuff from protected chest at @2",
			player:get_player_name(), minetest.pos_to_string(pos)))
	end,

	on_rightclick = function(pos, node, clicker)

		if minetest.is_protected(pos, clicker:get_player_name()) then
			return
		end

		local meta = minetest.get_meta(pos)

		if not meta then
			return
		end

		local spos = pos.x .. "," .. pos.y .. "," ..pos.z
		local formspec = "size[8,9]"
			.. default.gui_bg
			.. default.gui_bg_img
			.. default.gui_slots
			.. "list[nodemeta:".. spos .. ";main;0,0.3;8,4;]"
			.. "button[0,4.5;2,0.25;toup;" .. S("To Chest") .. "]"
			.. "field[2.3,4.8;4,0.25;chestname;;"
			.. meta:get_string("name") .. "]"
			.. "button[6,4.5;2,0.25;todn;" .. S("To Inventory") .. "]"
			.. "list[current_player;main;0,5;8,1;]"
			.. "list[current_player;main;0,6.08;8,3;8]"
			.. "listring[nodemeta:" .. spos .. ";main]"
			.. "listring[current_player;main]"

			minetest.show_formspec(
				clicker:get_player_name(),
				"custom:chest_" .. minetest.pos_to_string(pos),
				formspec)
	end,

	on_blast = function() end,
})
minetest.register_craft({
	output = "custom:protected_chest",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "custom:bronze_ingot", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})
-- Converts a normal chest into a protected chest
minetest.register_craft({
	type = "shapeless",
	output = "custom:protected_chest",
	recipe = {"custom:chest", "custom:bronze_ingot"}
})
-- Converts a locked chest into a protected chest
minetest.register_craft({
	type = "shapeless",
	output = "custom:protected_chest",
	recipe = {"custom:chest_locked", "custom:copper_ingot"}
})
-- Converts a protected chest into a locked chest
minetest.register_craft({
	type = "shapeless",
	output = "custom:chest_locked",
	recipe = {"custom:protected_chest"}
	})

