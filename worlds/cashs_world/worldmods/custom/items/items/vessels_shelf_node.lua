
local vessels_shelf_formspec =
	"size[8,7;]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[context;vessels;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;vessels]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0, 2.85)

local function get_vessels_shelf_formspec(inv)
	local formspec = vessels_shelf_formspec
	local invlist = inv and inv:get_list("vessels")
	-- Inventory slots overlay
	local vx, vy = 0, 0.3
	for i = 1, 16 do
		if i == 9 then
			vx = 0
			vy = vy + 1
		end
		if not invlist or invlist[i]:is_empty() then
			formspec = formspec ..
				"image[" .. vx .. "," .. vy .. ";1,1;custom_vessels_shelf_slot.png]"
		end
		vx = vx + 1
	end
	return formspec
end


local Info = {
    Name = "vessels_shelf",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Vessels Shelf",
    groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
    tiles = {"custom_wood.png", "custom_wood.png", "custom_wood.png",
		"custom_wood.png", "custom_vessels_shelf.png", "custom_vessels_shelf.png"},
    paramtype2 = "facedir",
    is_ground_content = false,
    sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_vessels_shelf_formspec(nil))
		local inv = meta:get_inventory()
		inv:set_size("vessels", 8 * 2)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("vessels")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if minetest.get_item_group(stack:get_name(), "vessel") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			   " moves stuff in vessels shelf at ".. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_vessels_shelf_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			   " moves stuff to vessels shelf at ".. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_vessels_shelf_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			   " takes stuff from vessels shelf at ".. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_vessels_shelf_formspec(meta:get_inventory()))
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "vessels", drops)
		drops[#drops + 1] = "custom:vessels_shelf"
		minetest.remove_node(pos)
		return drops
    end
}

local Recipes = {

    Number_Recipes = 1,

    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {"group:wood", "group:wood", "group:wood"},
            {"group:vessel", "group:vessel", "group:vessel"},
            {"group:wood", "group:wood", "group:wood"},
        },
    },
    Replacements = {nil},
    Cooking_Output = "",
    Cook_Time = 0,
    Burn_Time = 30,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
