
local Info = {
    Name = "protect",
    Type = "node",
    Depends_On = "nothing",
}

local S = protector.intllib

local Def = {
	description = S("Protection Block"),
	drawtype = "nodebox",
	tiles = {
		"moreblocks_circle_stone_bricks.png",
		"moreblocks_circle_stone_bricks.png",
		"moreblocks_circle_stone_bricks.png^custom_protector_logo.png"
	},
	sounds = default.node_sound_stone_defaults(),
	groups = {dig_immediate = 2, unbreakable = 1},
	is_ground_content = false,
	paramtype = "light",
	light_source = 4,

	node_box = {
		type = "fixed",
		fixed = {
			{-0.5 ,-0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},

	on_place = protector.check_overlap,

	after_place_node = function(pos, placer)

		local meta = minetest.get_meta(pos)

		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", S("Protection (owned by @1)", meta:get_string("owner")))
		meta:set_string("members", "")
	end,

	on_use = function(itemstack, user, pointed_thing)

		if pointed_thing.type ~= "node" then
			return
		end

		protector.can_dig(protector.radius, pointed_thing.under, user:get_player_name(), false, 2)
	end,

	on_rightclick = function(pos, node, clicker, itemstack)

		local meta = minetest.get_meta(pos)

		if meta
		and protector.can_dig(1, pos,clicker:get_player_name(), true, 1) then
			minetest.show_formspec(clicker:get_player_name(),
			"custom:node_" .. minetest.pos_to_string(pos), protector.generate_formspec(meta))
		end
	end,

	on_punch = function(pos, node, puncher)

		if minetest.is_protected(pos, puncher:get_player_name()) then
			return
		end

		minetest.add_entity(pos, "custom:display")
	end,

	can_dig = function(pos, player)

		return protector.can_dig(1, pos, player:get_player_name(), true, 1)
	end,

	on_blast = function()
	end,
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {"custom:stone", "custom:stone", "custom:stone"},
            {"custom:stone", "custom:steel_ingot", "custom:stone"},
            {"custom:stone", "custom:stone", "custom:stone"}
        },
    },
    Replacements = {nil},
    Cooking_Output = "",
    Cook_Time = 0,
    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
