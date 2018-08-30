-- Creating the coloredlightblocks, with and without frame, on and off

local coloredlightblocks = {}

coloredlightblocks.dyes = {
	{"white",      "White",      "basecolor_white"},
	{"grey",       "Grey",       "basecolor_grey"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"cyan",       "Cyan",       "basecolor_cyan"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"magenta",    "Magenta",    "basecolor_magenta"},
	{"orange",     "Orange",     "excolor_orange"},
	{"violet",     "Violet",     "excolor_violet"},
	{"brown",      "Brown",      "unicolor_dark_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
	{"dark_grey",  "Dark Grey",  "unicolor_darkgrey"},
	{"dark_green", "Dark Green", "unicolor_dark_green"},
}

for _, row in ipairs(coloredlightblocks.dyes) do
	local name = row[1]
	local desc = row[2]
	local craft_color_group = row[3]

	-- Node Definition coloredlightblocks on
	minetest.register_node("coloredlightblocks:"..name, {
		description = desc.." coloredlightblocks on",
		tiles = {"coloredlightblocks_"..name..".png"},
		paramtype = "light",
		light_source = 14,
		groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, mesecon_effector_on = 1, coloredlightblocks = 1},
		sounds = default.node_sound_glass_defaults(),

	-- start rnd basic machine code

		after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos);
			local list_name = "nodemeta:"..pos.x..','..pos.y..','..pos.z
			local deactivate = meta:get_int("deactivate");
			local form  = "size[2,2] field[0.25,0.5;2,1;deactivate;deactivate after ;"..deactivate.."]".."button_exit[0.,1;1,1;OK;OK]";
			meta:set_string("formspec", form);
		end,
		on_receive_fields = function(pos, formname, fields, player)
	       	 if minetest.is_protected(pos, player:get_player_name()) then return end
			if fields.deactivate then
				local meta = minetest.get_meta(pos);
				local deactivate = tonumber(fields.deactivate) or 0;
				if deactivate <0 or deactivate > 600 then deactivate = 0 end
				meta:set_int("deactivate",deactivate);
				local form  = "size[2,2] field[0.25,0.5;2,1;deactivate;deactivate after ;"..deactivate.."]".."button_exit[0.,1;1,1;OK;OK]";
				meta:set_string("formspec", form);
			end
        	 end,

		mesecons = {effector = {
			action_off = function (pos, node, ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_off"});
			end,
			action_on = function (pos, node, ttl)
				local meta = minetest.get_meta(pos);
				local count = tonumber(meta:get_string("infotext")) or 0;
				meta:set_string("infotext",count+1); -- increase activate count
			end
					}
		},

	-- end rnd basic machine code

	})

	-- Crafting coloredlightblocks on
		minetest.register_craft({
			type = "shapeless",
			output = 'coloredlightblocks:'..name,
			recipe = {'group:dye,'..craft_color_group, 'custom:glass', 'custom:torch'},
		})

	-- Node Definition coloredlightblocks off
	minetest.register_node("coloredlightblocks:"..name.."_off", {
		description = desc.." coloredlightblocks off",
		tiles = {"coloredlightblocks_"..name..".png"},
		paramtype = "light",
		drop = "coloredlightblocks:"..name,
		groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, mesecon_receptor_off = 1, coloredlightblocks = 1, not_in_creative_inventory = 1, not_in_craft_guide = 1},
		sounds = default.node_sound_glass_defaults(),

	-- start rnd basic machine code

		mesecons = {effector = {
			action_on = function (pos, node, ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name});
				local meta = minetest.get_meta(pos);
				local deactivate = meta:get_int("deactivate");

				if deactivate > 0 then
						--meta:set_int("active",0);
						minetest.after(deactivate,
							function()
								--if meta:get_int("active") ~= 1 then -- was not activated again, so turn it off
									minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_off"}); -- turn off again
									--meta:set_int("active",0);
								--end
							end
						)
				end
				end
				}
		},

	-- end rnd basic machine code

	})

	-- Node Definition coloredlightblocks framed on
	minetest.register_node("coloredlightblocks:"..name.."_framed", {
		description = desc.." coloredlightblocks framed on",
		tiles = {"coloredlightblocks_"..name.."_framed.png"},
		paramtype = "light",
		light_source = 14,
		groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, coloredlightblocks = 1},
		sounds = default.node_sound_glass_defaults(),

	-- start rnd basic machine code

		after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos);
			local list_name = "nodemeta:"..pos.x..','..pos.y..','..pos.z
			local deactivate = meta:get_int("deactivate");
			local form  = "size[2,2] field[0.25,0.5;2,1;deactivate;deactivate after ;"..deactivate.."]".."button_exit[0.,1;1,1;OK;OK]";
			meta:set_string("formspec", form);
		end,
		on_receive_fields = function(pos, formname, fields, player)
	       	 if minetest.is_protected(pos, player:get_player_name()) then return end
			if fields.deactivate then
				local meta = minetest.get_meta(pos);
				local deactivate = tonumber(fields.deactivate) or 0;
				if deactivate <0 or deactivate > 600 then deactivate = 0 end
				meta:set_int("deactivate",deactivate);
				local form  = "size[2,2] field[0.25,0.5;2,1;deactivate;deactivate after ;"..deactivate.."]".."button_exit[0.,1;1,1;OK;OK]";
				meta:set_string("formspec", form);
			end
        	 end,

		mesecons = {effector = {
			action_off = function (pos, node, ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_framed_off"});
			end,
			action_on = function (pos, node, ttl)
				local meta = minetest.get_meta(pos);
				local count = tonumber(meta:get_string("infotext")) or 0;
				meta:set_string("infotext",count+1); -- increase activate count
			end
					}
		},

	-- end rnd basic machine code

	})

	-- Crafting coloredlightblocks framed on
		minetest.register_craft({
			type = "shapeless",
			output = 'coloredlightblocks:'..name..'_framed',
			recipe = {'group:dye,'..craft_color_group, 'custom:glass', 'custom:torch', 'custom:stick'},
		})

	-- Node Definition coloredlightblocks framed off
	minetest.register_node("coloredlightblocks:"..name.."_framed_off", {
		description = desc.." coloredlightblocks framed off",
		tiles = {"coloredlightblocks_"..name.."_framed.png"},
		paramtype = "light",
		drop = "coloredlightblocks:"..name.."_framed",
		groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, coloredlightblocks = 1, not_in_creative_inventory = 1, not_in_craft_guide = 1},
		sounds = default.node_sound_glass_defaults(),

	-- start rnd basic machine code

		mesecons = {effector = {
			action_on = function (pos, node,ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_framed"});
				local meta = minetest.get_meta(pos);
				local deactivate = meta:get_int("deactivate");

				if deactivate > 0 then
						--meta:set_int("active",0);
						minetest.after(deactivate,
							function()
								--if meta:get_int("active") ~= 1 then -- was not activated again, so turn it off
									minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_framed_off"}); -- turn off again
									--meta:set_int("active",0);
								--end
							end
						)
				end
				end
				}
		},

	-- end rnd basic machine code

	})

	-- Node Definition coloredlightblocks stairs and slabs on
	-- Depends on stairsshine

	stairsshine.register_stair_and_slab(name,  "coloredlightblocks:"..name,
		{snappy = 2 , cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, coloredlightblocks = 1},
		{"coloredlightblocks_"..name..".png"},
		desc.." coloredlightblocks stair on",
		desc.. " coloredlightblocks slab on",
		default.node_sound_glass_defaults(),

		-- start rnd basic machine code

		{effector = {
			action_off = function (pos, node, ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_off"});
			end,
			action_on = function (pos, node, ttl)
				local meta = minetest.get_meta(pos);
				local count = tonumber(meta:get_string("infotext")) or 0;
				meta:set_string("infotext",count+1); -- increase activate count
			end
					}
		})

	-- end rnd basic machine code

	-- Node Definition coloredlightblocks stairs and slabs off
	-- Depends on stairsshineoff

	stairsshineoff.register_stair(name.."_off",  "coloredlightblocks:"..name.."_off",
		{snappy = 2 , cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, coloredlightblocks = 1, not_in_creative_inventory = 1, not_in_craft_guide = 1},
		{"coloredlightblocks_"..name..".png"},
		desc.." coloredlightblocks stair off",
		"stairsshine:stair_"..name,
		default.node_sound_glass_defaults(),

		-- start rnd basic machine code

		{effector = {
			action_on = function (pos, node,ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name});
				local meta = minetest.get_meta(pos);
				local deactivate = meta:get_int("deactivate");

				if deactivate > 0 then
						--meta:set_int("active",0);
						minetest.after(deactivate,
							function()
								--if meta:get_int("active") ~= 1 then -- was not activated again, so turn it off
									minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_off"}); -- turn off again
									--meta:set_int("active",0);
								--end
							end
						)
				end
				end
				}
		})

	-- end rnd basic machine code

	stairsshineoff.register_slab(name.."_off",  "coloredlightblocks:"..name.."_off",
		{snappy = 2 , cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, coloredlightblocks = 1, not_in_creative_inventory = 1, not_in_craft_guide = 1},
		{"coloredlightblocks_"..name..".png"},
		desc.." coloredlightblocks slab off",
		"stairsshine:slab_"..name,
		default.node_sound_glass_defaults(),

		-- start rnd basic machine code

		{effector = {
			action_on = function (pos, node,ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name});
				local meta = minetest.get_meta(pos);
				local deactivate = meta:get_int("deactivate");

				if deactivate > 0 then
						--meta:set_int("active",0);
						minetest.after(deactivate,
							function()
								--if meta:get_int("active") ~= 1 then -- was not activated again, so turn it off
									minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_off"}); -- turn off again
									--meta:set_int("active",0);
								--end
							end
						)
				end
				end
				}
		})

	-- end rnd basic machine code

	-- Node Definition coloredlightblocks stairs and slabs framed on
	-- Depends on stairsshine

	stairsshine.register_stair_and_slab(name.."_framed",  "coloredlightblocks:"..name.."_framed",
		{snappy = 2 , cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, coloredlightblocks = 1},
		{"coloredlightblocks_"..name.."_framed.png"},
		desc.." coloredlightblocks stair framed on",
		desc.. " coloredlightblocks slab framed on",
		default.node_sound_glass_defaults(),

		-- start rnd basic machine code

		{effector = {
			action_off = function (pos, node, ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_framed_off"});
			end,
			action_on = function (pos, node, ttl)
				local meta = minetest.get_meta(pos);
				local count = tonumber(meta:get_string("infotext")) or 0;
				meta:set_string("infotext",count+1); -- increase activate count
			end
					}
		})

	-- end rnd basic machine code

	-- Node Definition coloredlightblocks stairs and slabs framed off
	-- Depends on stairsshineoff

	stairsshineoff.register_stair(name.."_framed_off",  "coloredlightblocks:"..name.."_framed_off",
		{snappy = 2 , cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, coloredlightblocks = 1, not_in_creative_inventory = 1, not_in_craft_guide = 1},
		{"coloredlightblocks_"..name.."_framed.png"},
		desc.." coloredlightblocks stair framed off",
		"stairsshine:stair_"..name.."_framed",
		default.node_sound_glass_defaults(),

		-- start rnd basic machine code

		{effector = {
			action_on = function (pos, node,ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_framed"});
				local meta = minetest.get_meta(pos);
				local deactivate = meta:get_int("deactivate");

				if deactivate > 0 then
						--meta:set_int("active",0);
						minetest.after(deactivate,
							function()
								--if meta:get_int("active") ~= 1 then -- was not activated again, so turn it off
									minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_framed_off"}); -- turn off again
									--meta:set_int("active",0);
								--end
							end
						)
				end
				end
				}
		})

	-- end rnd basic machine code

	stairsshineoff.register_slab(name.."_framed_off",  "coloredlightblocks:"..name.."_framed_off",
		{snappy = 2 , cracky = 3, oddly_breakable_by_hand = 3, puts_out_fire = 1, coloredlightblocks = 1, not_in_creative_inventory=1, not_in_craft_guide = 1},
		{"coloredlightblocks_"..name.."_framed.png"},
		desc.." coloredlightblocks slab framed off",
		"stairsshine:slab_"..name.."_framed",
		default.node_sound_glass_defaults(),

		-- start rnd basic machine code

		{effector = {
			action_on = function (pos, node,ttl)
				minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_framed"});
				local meta = minetest.get_meta(pos);
				local deactivate = meta:get_int("deactivate");

				if deactivate > 0 then
						--meta:set_int("active",0);
						minetest.after(deactivate,
							function()
								--if meta:get_int("active") ~= 1 then -- was not activated again, so turn it off
									minetest.swap_node(pos,{name = "coloredlightblocks:"..name.."_framed_off"}); -- turn off again
									--meta:set_int("active",0);
								--end
							end
						)
				end
				end
				}
		})

	-- end rnd basic machine code

	-- Code for putting the lights on and off by punching it

	local on_lamp_puncher = function (pos, node, puncher)

		-- Coloredlightblocks

		if node.name == "coloredlightblocks:"..name then
			minetest.add_node(pos, {name="coloredlightblocks:"..name.."_off"})
		elseif node.name == "coloredlightblocks:"..name.."_off" then
			minetest.add_node(pos, {name="coloredlightblocks:"..name})

		-- Coloredlightblocks framed

		elseif node.name == "coloredlightblocks:"..name.."_framed" then
			minetest.add_node(pos, {name="coloredlightblocks:"..name.."_framed_off"})
		elseif node.name == "coloredlightblocks:"..name.."_framed_off" then
			minetest.add_node(pos, {name="coloredlightblocks:"..name.."_framed"})

		-- Coloredlightblocks stairs

		elseif node.name == "stairsshine:stair_"..name and node.param2 == 0 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_off", param2 = 0})
		elseif node.name == "stairsshineoff:stair_"..name.."_off" and node.param2 == 0 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name, param2 = 0})

		elseif node.name == "stairsshine:stair_"..name and node.param2 == 1 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_off", param2 = 1})
		elseif node.name == "stairsshineoff:stair_"..name.."_off" and node.param2 == 1 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name, param2 = 1})

		elseif node.name == "stairsshine:stair_"..name and node.param2 == 2 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_off", param2 = 2})
		elseif node.name == "stairsshineoff:stair_"..name.."_off" and node.param2 == 2 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name, param2 = 2})

		elseif node.name == "stairsshine:stair_"..name and node.param2 == 3 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_off", param2 = 3})
		elseif node.name == "stairsshineoff:stair_"..name.."_off" and node.param2 == 3 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name, param2 = 3})

		elseif node.name == "stairsshine:stair_"..name and node.param2 == 20 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_off", param2 = 20})
		elseif node.name == "stairsshineoff:stair_"..name.."_off" and node.param2 == 20 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name, param2 = 20})

		elseif node.name == "stairsshine:stair_"..name and node.param2 == 21 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_off", param2 = 21})
		elseif node.name == "stairsshineoff:stair_"..name.."_off" and node.param2 == 21 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name, param2 = 21})

		elseif node.name == "stairsshine:stair_"..name and node.param2 == 22 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_off", param2 = 22})
		elseif node.name == "stairsshineoff:stair_"..name.."_off" and node.param2 == 22 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name, param2 = 22})

		elseif node.name == "stairsshine:stair_"..name and node.param2 == 23 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_off", param2 = 23})
		elseif node.name == "stairsshineoff:stair_"..name.."_off" and node.param2 == 23 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name, param2 = 23})

		-- Coloredlightblocks slabs

		elseif node.name == "stairsshine:slab_"..name and node.param2 == 20 then
			minetest.add_node(pos, {name="stairsshineoff:slab_"..name.."_off", param2 = 20})
		elseif node.name == "stairsshineoff:slab_"..name.."_off" and node.param2 == 20 then
			minetest.add_node(pos, {name="stairsshine:slab_"..name, param2 = 20})

		elseif node.name == "stairsshine:slab_"..name then
			minetest.add_node(pos, {name="stairsshineoff:slab_"..name.."_off"})
		elseif node.name == "stairsshineoff:slab_"..name.."_off" then
			minetest.add_node(pos, {name="stairsshine:slab_"..name})

		-- Coloredlightblocks stairs framed

		elseif node.name == "stairsshine:stair_"..name.."_framed" and node.param2 == 0 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_framed_off", param2 = 0})
		elseif node.name == "stairsshineoff:stair_"..name.."_framed_off" and node.param2 == 0 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name.."_framed", param2 = 0})

		elseif node.name == "stairsshine:stair_"..name.."_framed" and node.param2 == 1 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_framed_off", param2 = 1})
		elseif node.name == "stairsshineoff:stair_"..name.."_framed_off" and node.param2 == 1 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name.."_framed", param2 = 1})

		elseif node.name == "stairsshine:stair_"..name.."_framed" and node.param2 == 2 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_framed_off", param2 = 2})
		elseif node.name == "stairsshineoff:stair_"..name.."_framed_off" and node.param2 == 2 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name.."_framed", param2 = 2})

		elseif node.name == "stairsshine:stair_"..name.."_framed" and node.param2 == 3 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_framed_off", param2 = 3})
		elseif node.name == "stairsshineoff:stair_"..name.."_framed_off" and node.param2 == 3 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name.."_framed", param2 = 3})

		elseif node.name == "stairsshine:stair_"..name.."_framed" and node.param2 == 20 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_framed_off", param2 = 20})
		elseif node.name == "stairsshineoff:stair_"..name.."_framed_off" and node.param2 == 20 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name.."_framed", param2 = 20})

		elseif node.name == "stairsshine:stair_"..name.."_framed" and node.param2 == 21 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_framed_off", param2 = 21})
		elseif node.name == "stairsshineoff:stair_"..name.."_framed_off" and node.param2 == 21 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name.."_framed", param2 = 21})

		elseif node.name == "stairsshine:stair_"..name.."_framed" and node.param2 == 22 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_framed_off", param2 = 22})
		elseif node.name == "stairsshineoff:stair_"..name.."_framed_off" and node.param2 == 22 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name.."_framed", param2 = 22})

		elseif node.name == "stairsshine:stair_"..name.."_framed" and node.param2 == 23 then
			minetest.add_node(pos, {name="stairsshineoff:stair_"..name.."_framed_off", param2 = 23})
		elseif node.name == "stairsshineoff:stair_"..name.."_framed_off" and node.param2 == 23 then
			minetest.add_node(pos, {name="stairsshine:stair_"..name.."_framed", param2 = 23})

		-- Coloredlightblocks slabs framed

		elseif node.name == "stairsshine:slab_"..name.."_framed" and node.param2 == 20 then
			minetest.add_node(pos, {name="stairsshineoff:slab_"..name.."_framed_off", param2 = 20})
		elseif node.name == "stairsshineoff:slab_"..name.."_framed_off" and node.param2 == 20 then
			minetest.add_node(pos, {name="stairsshine:slab_"..name.."_framed", param2 = 20})

		elseif node.name == "stairsshine:slab_"..name.."_framed" then
			minetest.add_node(pos, {name="stairsshineoff:slab_"..name.."_framed_off"})
		elseif node.name == "stairsshineoff:slab_"..name.."_framed_off" then
			minetest.add_node(pos, {name="stairsshine:slab_"..name.."_framed"})

		end
	end

	minetest.register_on_punchnode(on_lamp_puncher)

end
