
local Info = {
    Name = "protect2",
    Type = "node",
    Depends_On = "nothing",
}

local S = protector.intllib

local Def = {
	description = S("Protection Logo"),
	tiles = {"custom_protector_logo.png"},
	wield_image = "custom_protector_logo.png",
	inventory_image = "custom_protector_logo.png",
	sounds = default.node_sound_stone_defaults(),
	groups = {dig_immediate = 2, unbreakable = 1},
	paramtype = 'light',
	paramtype2 = "wallmounted",
	legacy_wallmounted = true,
	light_source = 4,
	drawtype = "nodebox",
	sunlight_propagates = true,
	walkable = true,
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.375, 0.4375, -0.5, 0.375, 0.5, 0.5},
		wall_bottom = {-0.375, -0.5, -0.5, 0.375, -0.4375, 0.5},
		wall_side   = {-0.5, -0.5, -0.375, -0.4375, 0.5, 0.375},
	},
	selection_box = {type = "wallmounted"},

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

		if protector.can_dig(1, pos, clicker:get_player_name(), true, 1) then

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
    Number_Recipes = 2,
    Quantity = {1, 1},
    Shapeless = {false, true},
    Formula = {
        {
		{"custom:stone", "custom:stone", "custom:stone"},
		{"custom:stone", "custom:bronze_ingot", "custom:stone"},
		{"custom:stone", "custom:stone", "custom:stone"}
        },

        {
            "custom:protect", "custom:copper_ingot",
        },
    },
    Replacements = {nil, nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
