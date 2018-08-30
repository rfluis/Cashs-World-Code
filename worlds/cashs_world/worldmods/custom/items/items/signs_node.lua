
local default_sign = signs_lib.default_sign
local default_sign_image = signs_lib.default_sign_image
local default_sign_metal = signs_lib.default_sign_metal
local default_sign_metal_image = signs_lib.default_sign_metal_image
local sign_groups = {choppy=2, dig_immediate=2}


minetest.register_node(default_sign, {
	description = S("Sign"),
	inventory_image = default_sign_image,
	wield_image = default_sign_image,
	node_placement_prediction = "",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	drawtype = "nodebox",
	node_box = signs_lib.regular_wall_sign_model.nodebox,
	tiles = {"signs_wall_sign.png"},
	groups = sign_groups,

	on_place = function(itemstack, placer, pointed_thing)
		return signs_lib.determine_sign_type(itemstack, placer, pointed_thing)
	end,
	on_construct = function(pos)
		signs_lib.construct_sign(pos)
	end,
	on_destruct = function(pos)
		signs_lib.destruct_sign(pos)
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		signs_lib.receive_fields(pos, formname, fields, sender)
	end,
	on_punch = function(pos, node, puncher)
		signs_lib.update_sign(pos)
	end,
	on_rotate = signs_lib.wallmounted_rotate
})

minetest.register_node("custom:sign_yard", {
    paramtype = "light",
	sunlight_propagates = true,
    paramtype2 = "facedir",
    drawtype = "nodebox",
    node_box = signs_lib.yard_sign_model.nodebox,
	selection_box = {
		type = "fixed",
		fixed = {-0.4375, -0.5, -0.0625, 0.4375, 0.375, 0}
	},
    tiles = {"signs_top.png", "signs_bottom.png", "signs_side.png", "signs_side.png", "signs_back.png", "signs_front.png"},
    groups = {choppy=2, dig_immediate=2},
    drop = default_sign,

    on_construct = function(pos)
        signs_lib.construct_sign(pos)
    end,
    on_destruct = function(pos)
        signs_lib.destruct_sign(pos)
    end,
	on_receive_fields = function(pos, formname, fields, sender)
		signs_lib.receive_fields(pos, formname, fields, sender)
	end,
	on_punch = function(pos, node, puncher)
		signs_lib.update_sign(pos)
	end,
})

minetest.register_node("custom:sign_hanging", {
    paramtype = "light",
	sunlight_propagates = true,
    paramtype2 = "facedir",
    drawtype = "nodebox",
    node_box = signs_lib.hanging_sign_model.nodebox,
    selection_box = {
		type = "fixed",
		fixed = {-0.45, -0.275, -0.049, 0.45, 0.5, 0.049}
	},
    tiles = {
		"signs_hanging_top.png",
		"signs_hanging_bottom.png",
		"signs_hanging_side.png",
		"signs_hanging_side.png",
		"signs_hanging_back.png",
		"signs_hanging_front.png"
	},
    groups = {choppy=2, dig_immediate=2},
    drop = default_sign,

    on_construct = function(pos)
        signs_lib.construct_sign(pos)
    end,
    on_destruct = function(pos)
        signs_lib.destruct_sign(pos)
    end,
	on_receive_fields = function(pos, formname, fields, sender)
		signs_lib.receive_fields(pos, formname, fields, sender)
	end,
	on_punch = function(pos, node, puncher)
		signs_lib.update_sign(pos)
	end,
})

minetest.register_node("custom:sign_post", {
    paramtype = "light",
	sunlight_propagates = true,
    paramtype2 = "facedir",
    drawtype = "nodebox",
    node_box = signs_lib.sign_post_model.nodebox,
    tiles = {
		"signs_post_top.png",
		"signs_post_bottom.png",
		"signs_post_side.png",
		"signs_post_side.png",
		"signs_post_back.png",
		"signs_post_front.png",
	},
    groups = {choppy=2, dig_immediate=2},
    drop = {
		max_items = 2,
		items = {
			{ items = { default_sign }},
			{ items = { "custom:fence_wood" }},
		},
    },
})

-- Locked wall sign

minetest.register_privilege("sign_editor", "Can edit all locked signs")

minetest.register_node("custom:sign_wall_locked", {
	description = S("Sign"),
	inventory_image = "signs_locked_inv.png",
	wield_image = "signs_locked_inv.png",
	node_placement_prediction = "",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	drawtype = "nodebox",
	node_box = signs_lib.regular_wall_sign_model.nodebox,
	tiles = { "signs_wall_sign_locked.png" },
	groups = sign_groups,
	on_place = function(itemstack, placer, pointed_thing)
		return signs_lib.determine_sign_type(itemstack, placer, pointed_thing, true)
	end,
	on_construct = function(pos)
		signs_lib.construct_sign(pos, true)
	end,
	on_destruct = function(pos)
		signs_lib.destruct_sign(pos)
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local pname = sender:get_player_name() or ""
		if pname ~= owner and pname ~= minetest.setting_get("name")
		  and not minetest.check_player_privs(pname, {sign_editor=true}) then
			return
		end
		signs_lib.receive_fields(pos, formname, fields, sender, true)
	end,
	on_punch = function(pos, node, puncher)
		signs_lib.update_sign(pos)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local pname = player:get_player_name()
		return pname == owner or pname == minetest.setting_get("name")
			or minetest.check_player_privs(pname, {sign_editor=true})
	end,
	on_rotate = signs_lib.wallmounted_rotate
})

-- default metal sign, if defined

if minetest.registered_nodes["custom:sign_wall_steel"] then
	minetest.register_node(default_sign_metal, {
		description = S("Sign"),
		inventory_image = default_sign_metal_image,
		wield_image = default_sign_metal_image,
		node_placement_prediction = "",
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "wallmounted",
		drawtype = "nodebox",
		node_box = signs_lib.regular_wall_sign_model.nodebox,
		tiles = {"signs_wall_sign_metal.png"},
		groups = sign_groups,

		on_place = function(itemstack, placer, pointed_thing)
			return signs_lib.determine_sign_type(itemstack, placer, pointed_thing)
		end,
		on_construct = function(pos)
			signs_lib.construct_sign(pos)
		end,
		on_destruct = function(pos)
			signs_lib.destruct_sign(pos)
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			signs_lib.receive_fields(pos, formname, fields, sender)
		end,
		on_punch = function(pos, node, puncher)
			signs_lib.update_sign(pos)
		end,
		on_rotate = signs_lib.wallmounted_rotate
	})
end

-- metal, colored signs
if signs_lib.enable_colored_metal_signs then
	local sign_colors = { "green", "yellow", "red", "white_red", "white_black", "orange", "blue", "brown" }
	local sign_default_text_colors = { "f", "0", "f", "4", "0", "0", "f", "f" }

	for i, color in ipairs(sign_colors) do
		minetest.register_node("custom:sign_wall_"..color, {
			description = S("Sign ("..color..", metal)"),
			inventory_image = "signs_"..color.."_inv.png",
			wield_image = "signs_"..color.."_inv.png",
			node_placement_prediction = "",
			paramtype = "light",
			sunlight_propagates = true,
			paramtype2 = "facedir",
			drawtype = "nodebox",
			node_box = signs_lib.metal_wall_sign_model.nodebox,
			tiles = {
				"signs_metal_tb.png",
				"signs_metal_tb.png",
				"signs_metal_sides.png",
				"signs_metal_sides.png",
				"signs_metal_back.png",
				"signs_"..color.."_front.png"
			},
			default_color = sign_default_text_colors[i],
			groups = sign_groups,
			on_place = function(itemstack, placer, pointed_thing)
				return signs_lib.determine_sign_type(itemstack, placer, pointed_thing)
			end,
			on_construct = function(pos)
				signs_lib.construct_sign(pos)
			end,
			on_destruct = function(pos)
				signs_lib.destruct_sign(pos)
			end,
			on_receive_fields = function(pos, formname, fields, sender)
				signs_lib.receive_fields(pos, formname, fields, sender)
			end,
			on_punch = function(pos, node, puncher)
				signs_lib.update_sign(pos)
			end,
		})
	end
end

minetest.register_entity("custom:signs_text", {
    collisionbox = { 0, 0, 0, 0, 0, 0 },
    visual = "upright_sprite",
    textures = {},

	on_activate = signs_lib.signs_text_on_activate,
})


--minetest.register_alias("homedecor:fence_wood_with_sign", "custom:sign_post")
minetest.register_alias("sign_wall_locked", "custom:sign_wall_locked")

signs_lib.register_fence_with_sign("custom:fence_wood", "custom:sign_post")

-- restore signs' text after /clearobjects and the like, the next time
-- a block is reloaded by the server.

minetest.register_lbm({
	nodenames = signs_lib.sign_node_list,
	name = "custom:restore_sign_text",
	label = "Restore sign text",
	run_at_every_load = true,
	action = function(pos, node)
		signs_lib.update_sign(pos)
	end
})

-- locked sign

minetest.register_craft({
	output = "custom:sign_wall_locked",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "custom:steel_ingot"},
		{"", "group:stick", ""},
	}
})

--Alternate recipe

minetest.register_craft({
    	output = "custom:sign_wall_locked",
    	recipe = {
        	{default_sign},
        	{"custom:steel_ingot"},
    },
})

-- craft recipes for the metal signs
if signs_lib.enable_colored_metal_signs then

	minetest.register_craft( {
		output = "custom:sign_wall_green",
		recipe = {
				{ "dye:dark_green", "dye:white", "dye:dark_green" },
				{ "", default_sign_metal, "" }
		},
	})

--[[	minetest.register_craft( {
		output = "signs:sign_wall_green 2",
		recipe = {
				{ "dye:dark_green", "dye:white", "dye:dark_green" },
				{ "steel:sheet_metal", "steel:sheet_metal", "steel:sheet_metal" }
		},
	})
--]]

	minetest.register_craft( {
		output = "custom:sign_wall_yellow",
		recipe = {
				{ "dye:yellow", "dye:black", "dye:yellow" },
				{ "", default_sign_metal, "" }
		},
	})

--[[	minetest.register_craft( {
		output = "signs:sign_wall_yellow 2",
		recipe = {
				{ "dye:yellow", "dye:black", "dye:yellow" },
				{ "steel:sheet_metal", "steel:sheet_metal", "steel:sheet_metal" }
		},
	})
--]]

	minetest.register_craft( {
		output = "custom:sign_wall_red",
		recipe = {
				{ "dye:red", "dye:white", "dye:red" },
				{ "", default_sign_metal, "" }
		},
	})

--[[	minetest.register_craft( {
		output = "signs:sign_wall_red 2",
		recipe = {
				{ "dye:red", "dye:white", "dye:red" },
				{ "steel:sheet_metal", "steel:sheet_metal", "steel:sheet_metal" }
		},
	})
--]]

	minetest.register_craft( {
		output = "custom:sign_wall_white_red",
		recipe = {
				{ "dye:white", "dye:red", "dye:white" },
				{ "", default_sign_metal, "" }
		},
	})

--[[	minetest.register_craft( {
		output = "signs:sign_wall_white_red 2",
		recipe = {
				{ "dye:white", "dye:red", "dye:white" },
				{ "steel:sheet_metal", "steel:sheet_metal", "steel:sheet_metal" }
		},
	})
--]]

	minetest.register_craft( {
		output = "custom:sign_wall_white_black",
		recipe = {
				{ "dye:white", "dye:black", "dye:white" },
				{ "", default_sign_metal, "" }
		},
	})

--[[	minetest.register_craft( {
		output = "signs:sign_wall_white_black 2",
		recipe = {
				{ "dye:white", "dye:black", "dye:white" },
				{ "steel:sheet_metal", "steel:sheet_metal", "steel:sheet_metal" }
		},
	})
--]]

	minetest.register_craft( {
		output = "custom:sign_wall_orange",
		recipe = {
				{ "dye:orange", "dye:black", "dye:orange" },
				{ "", default_sign_metal, "" }
		},
	})

--[[	minetest.register_craft( {
		output = "signs:sign_wall_orange 2",
		recipe = {
				{ "dye:orange", "dye:black", "dye:orange" },
				{ "steel:sheet_metal", "steel:sheet_metal", "steel:sheet_metal" }
		},
	})
--]]

	minetest.register_craft( {
		output = "custom:sign_wall_blue",
		recipe = {
				{ "dye:blue", "dye:white", "dye:blue" },
				{ "", default_sign_metal, "" }
		},
	})

--[[	minetest.register_craft( {
		output = "signs:sign_wall_blue 2",
		recipe = {
				{ "dye:blue", "dye:white", "dye:blue" },
				{ "steel:sheet_metal", "steel:sheet_metal", "steel:sheet_metal" }
		},
	})
--]]

	minetest.register_craft( {
		output = "custom:sign_wall_brown",
		recipe = {
				{ "dye:brown", "dye:white", "dye:brown" },
				{ "", default_sign_metal, "" }
		},
	})

--[[	minetest.register_craft( {
		output = "signs:sign_wall_brown 2",
		recipe = {
				{ "dye:brown", "dye:white", "dye:brown" },
				{ "steel:sheet_metal", "steel:sheet_metal", "steel:sheet_metal" }
		},
	})
--]]
end

if minetest.setting_get("log_mods") then
	minetest.log("action", S("signs loaded"))
end
