
-- SIGNS
--
local function register_sign(material, desc, def)
	minetest.register_node("custom:sign_wall_" .. material, {
		description = desc .. " Sign",
		drawtype = "nodebox",
		tiles = {"custom_sign_wall_" .. material .. ".png"},
		inventory_image = "custom_sign_" .. material .. ".png",
		wield_image = "custom_sign_" .. material .. ".png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
			wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
			wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
		},
		groups = def.groups,
		legacy_wallmounted = true,
		sounds = def.sounds,

		on_construct = function(pos)
			--local n = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", "field[text;;${text}]")
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
			local player_name = sender:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			local meta = minetest.get_meta(pos)
			if not fields.text then return end
			minetest.log("action", (player_name or "") .. " wrote \"" ..
				fields.text .. "\" to sign at " .. minetest.pos_to_string(pos))
			meta:set_string("text", fields.text)
			meta:set_string("infotext", '"' .. fields.text .. '"')
		end,
	})
end

register_sign("wood", "Wooden", {
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy = 2, attached_node = 1, flammable = 2, oddly_breakable_by_hand = 3}
})
minetest.register_craft({
	output = 'custom:sign_wall_wood 3',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
	}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:sign_wall_wood",
	burntime = 10,
})

register_sign("steel", "Steel", {
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 2, attached_node = 1}
})
minetest.register_craft({
	output = 'custom:sign_wall_steel 3',
	recipe = {
		{'custom:steel_ingot', 'custom:steel_ingot', 'custom:steel_ingot'},
		{'custom:steel_ingot', 'custom:steel_ingot', 'custom:steel_ingot'},
		{'', 'group:stick', ''},
	}
})





-- OTHER STUFF
--





print("blocks.lua file loaded")
