
-- older privilage for admins to bypass protected nodes, do not use anymore
-- instead grant admin 'protection_bypass' privelage.
minetest.register_privilege("delprotect","Ignore player protection. (OBSOLETE) Use protection_bypass instead.")


-- get minetest.conf settings
protector = {}
protector.mod = "redo"
protector.radius = tonumber(minetest.setting_get("protector_radius")) or 5
protector.drop = minetest.setting_getbool("protector_drop") or false
protector.flip = minetest.setting_getbool("protector_flip") or false
protector.hurt = tonumber(minetest.setting_get("protector_hurt")) or 0
protector.spawn = tonumber(minetest.setting_get("protector_spawn")
	or minetest.setting_get("protector_pvp_spawn")) or 0
local statspawn = minetest.setting_get_pos("static_spawnpoint") or {x = 0, y = 2, z = 0}
protector.pvp = minetest.setting_getbool("protector_pvp")
protector.removal_names = ""

if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s, a, ...)
		if a == nil then
			return s
		end
		a = {a, ...}
		return s:gsub("(@?)@(%(?)(%d+)(%)?)",
			function(e, o, n, c)
				if e == ""then
					return a[tonumber(n)] .. (o == "" and c or "")
				else
					return "@" .. o .. n .. c
				end
			end)
		end
end
protector.intllib = S
local S = protector.intllib


-- check if pos is inside a protected spawn area
local function inside_spawn(pos, radius)

	if protector.spawn <= 0 then
		return false
	end

	if pos.x < statspawn.x + radius
	and pos.x > statspawn.x - radius
	and pos.y < statspawn.y + radius
	and pos.y > statspawn.y - radius
	and pos.z < statspawn.z + radius
	and pos.z > statspawn.z - radius then

		return true
	end

	return false
end

-- I need to study this more closely.
-- IDK if this function totally replaces the default minetest.is_protected function
-- or if this function is executed before executing the default minetest.is_protected function -- JDC
protector.old_is_protected = minetest.is_protected

-- check for protected area, return true if protected and digger isn't on list
-- This function overrides the default minetest.is_protected function which is provided by ???? - JDC
function minetest.is_protected(pos, digger)

	-- is area protected against digger?
	if not protector.can_dig(protector.radius, pos, digger, false, 1) then

		local player = minetest.get_player_by_name(digger)

		-- hurt player if protection violated
		if protector.hurt > 0
		and player then
			player:set_hp(player:get_hp() - protector.hurt)
		end

		-- flip player when protection violated
		if protector.flip
		and player then

			-- yaw + 180°
			--local yaw = player:get_look_horizontal() + math.pi
			local yaw = player:get_look_yaw() + math.pi

			if yaw > 2 * math.pi then
				yaw = yaw - 2 * math.pi
			end

			--player:set_look_horizontal(yaw)
			player:set_look_yaw(yaw)

			-- invert pitch
			--player:set_look_vertical(-player:get_look_vertical())
			player:set_look_pitch(-player:get_look_pitch())

			-- if digging below player, move up to avoid falling through hole
			local pla_pos = player:getpos()

			if pos.y < pla_pos.y then

				player:setpos({
					x = pla_pos.x,
					y = pla_pos.y + 0.8,
					z = pla_pos.z
				})
			end
		end

		-- drop tool/item if protection violated
		if protector.drop == true
		and player then

			local holding = player:get_wielded_item()

			if holding:to_string() ~= "" then

				-- take stack
				local sta = holding:take_item(holding:get_count())
				player:set_wielded_item(holding)

				-- incase of lag, reset stack
				minetest.after(0.1, function()
					player:set_wielded_item(holding)

					-- drop stack
					local obj = minetest.add_item(player:getpos(), sta)
					if obj then
						obj:setvelocity({x = 0, y = 5, z = 0})
					end
				end)

			end
		end

		return true
	end

	-- otherwise can dig or place
	return protector.old_is_protected(pos, digger)

end

-- return list of members as a table
function protector.get_member_list(meta)

	return meta:get_string("members"):split(" ")
end

-- write member list table in protector meta as string
function protector.set_member_list(meta, list)

	meta:set_string("members", table.concat(list, " "))
end

-- check if player name is a member
function protector.is_member(meta, name)

	for _, n in pairs(protector.get_member_list(meta)) do

		if n == name then
			return true
		end
	end

	return false
end

-- add player name to table as member
function protector.add_member(meta, name)

	if protector.is_member(meta, name) then
		return
	end

	local list = protector.get_member_list(meta)

	table.insert(list, name)

	protector.set_member_list(meta, list)
end

-- remove player name from table
function protector.del_member(meta, name)

	local list = protector.get_member_list(meta)

	for i, n in pairs(list) do

		if n == name then
			table.remove(list, i)
			break
		end
	end

	protector.set_member_list(meta, list)
end

-- protector interface
function protector.generate_formspec(meta)

	local formspec = "size[8,7]"
		.. default.gui_bg
		.. default.gui_bg_img
		.. default.gui_slots
		.. "label[2.5,0;" .. S("-- Protector interface --") .. "]"
		.. "label[0,1;" .. S("PUNCH node to show protected area or USE for area check") .. "]"
		.. "label[0,2;" .. S("Members:") .. "]"
		.. "button_exit[2.5,6.2;3,0.5;close_me;" .. S("Close") .. "]"

	local members = protector.get_member_list(meta)
	local npp = 12 -- max users added to protector list
	local i = 0

	for n = 1, #members do

		if i < npp then

			-- show username
			formspec = formspec .. "button[" .. (i % 4 * 2)
			.. "," .. math.floor(i / 4 + 3)
			.. ";1.5,.5;protector_member;" .. members[n] .. "]"

			-- username remove button
			.. "button[" .. (i % 4 * 2 + 1.25) .. ","
			.. math.floor(i / 4 + 3)
			.. ";.75,.5;protector_del_member_" .. members[n] .. ";X]"
		end

		i = i + 1
	end

	if i < npp then

		-- user name entry field
		formspec = formspec .. "field[" .. (i % 4 * 2 + 1 / 3) .. ","
		.. (math.floor(i / 4 + 3) + 1 / 3)
		.. ";1.433,.5;protector_add_member;;]"

		-- username add button
		.."button[" .. (i % 4 * 2 + 1.25) .. ","
		.. math.floor(i / 4 + 3) .. ";.75,.5;protector_submit;+]"

	end

	return formspec
end

function protector.can_dig(r, pos, digger, onlyowner, infolevel)

-- Infolevel:
-- 0 for no info
-- 1 for "This area is owned by <owner> !" if you can't dig
-- 2 for "This area is owned by <owner>.
-- 3 for checking protector overlaps

	if not digger
	or not pos then
		return false
	end

	-- delprotect and protector_bypass privileged users can override protection
	if ( minetest.check_player_privs(digger, {delprotect = true})
	or minetest.check_player_privs(digger, {protection_bypass = true}) )
	and infolevel == 1 then
		return true
	end

	-- infolevel 3 is only used to bypass priv check, change to 1 now
	if infolevel == 3 then infolevel = 1 end

	-- is spawn area protected ?
	if inside_spawn(pos, protector.spawn) then

		minetest.chat_send_player(digger,
			S("Spawn @1 has been protected up to a @2 block radius.",
			minetest.pos_to_string(statspawn), protector.spawn))

		return false
	end

	-- find the protector nodes
	local pos = minetest.find_nodes_in_area(
		{x = pos.x - r, y = pos.y - r, z = pos.z - r},
		{x = pos.x + r, y = pos.y + r, z = pos.z + r},
		{"custom:protect", "custom:protect2"})

	local meta, owner, members

	for n = 1, #pos do

		meta = minetest.get_meta(pos[n])
		owner = meta:get_string("owner") or ""
		members = meta:get_string("members") or ""

		-- node change and digger isn't owner
		if owner ~= digger
		and infolevel == 1 then

			-- and you aren't on the member list
			if onlyowner
			or not protector.is_member(meta, digger) then

				minetest.chat_send_player(digger,
					S("This area is owned by @1!", owner))

					return false
			end
		end

		-- when using protector as tool, show protector information
		if infolevel == 2 then

			minetest.chat_send_player(digger,
			S("This area is owned by @1.", owner))

			minetest.chat_send_player(digger,
			S("Protection located at: @1", minetest.pos_to_string(pos[n])))

			if members ~= "" then

				minetest.chat_send_player(digger,
				S("Members: @1.", members))
			end

			return false
		end

	end

	-- show when you can build on unprotected area
	if infolevel == 2 then

		if #pos < 1 then

			minetest.chat_send_player(digger,
			S("This area is not protected."))
		end

		minetest.chat_send_player(digger, S("You can build here."))
	end

	return true
end

-- make sure protection block doesn't overlap another protector's area
function protector.check_overlap(itemstack, placer, pointed_thing)

	if pointed_thing.type ~= "node" then
		return itemstack
	end

	local pos = pointed_thing.above

	-- make sure protector doesn't overlap onto protected spawn area
	if inside_spawn(pos, protector.spawn + protector.radius) then

		minetest.chat_send_player(placer:get_player_name(),
			S("Spawn @1 has been protected up to a @2 block radius.",
			minetest.pos_to_string(statspawn), protector.spawn))

		return itemstack
	end

	-- make sure protector doesn't overlap any other player's area
	if not protector.can_dig(protector.radius * 2, pos,
		placer:get_player_name(), true, 3) then

		minetest.chat_send_player(placer:get_player_name(),
			S("Overlaps into above players protected area"))

		return itemstack
	end

	return minetest.item_place(itemstack, placer, pointed_thing)

end

----trapdoor----
function protector.register_trapdoor(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node, clicker, itemstack, pointed_thing)
		if minetest.is_protected(pos, clicker:get_player_name()) then
			return
		end
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = "custom_door_open" end
		if node.name == name_opened then sound = "custom_door_close" end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.swap_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	-- Common trapdoor configuration
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -6/16, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -6/16, 0.5}
	}
	def_closed.tiles = { def.tile_front, def.tile_front, def.tile_side, def.tile_side,
		def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 6/16, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 6/16, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side,
			def.tile_side .. '^[transform3',
			def.tile_side .. '^[transform1',
			def.tile_front, def.tile_front }

	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end

-- Registers a door. I want this function to:
-- Assign parameters common to all protected doors.
-- Accept parameters that are defined by the door being registered.
-- call the registration function in registration_library.lua
function protector.register_door(name, def)
	def.groups.not_in_creative_inventory = 1

	local box = {{-0.5, -0.5, -0.5, 0.5, 0.5, -0.5+1.5/16}}

	def.node_box_bottom = box
	def.node_box_top = box
	def.selection_box_bottom = box
	def.selection_box_top = box
	def.sound_close_door  = "custom_door_close"
	def.sound_open_door = "custom_door_open"

	minetest.register_craftitem(name, {
		description = def.description,
		inventory_image = def.inventory_image,

		on_place = function(itemstack, placer, pointed_thing)
			if not pointed_thing.type == "node" then
				return itemstack
			end

			local ptu = pointed_thing.under
			local nu = minetest.get_node(ptu)
			if minetest.registered_nodes[nu.name]
			and minetest.registered_nodes[nu.name].on_rightclick then
				return minetest.registered_nodes[nu.name].on_rightclick(ptu, nu, placer, itemstack)
			end

			local pt = pointed_thing.above
			local pt2 = {x=pt.x, y=pt.y, z=pt.z}
			pt2.y = pt2.y+1
			if
				not minetest.registered_nodes[minetest.get_node(pt).name].buildable_to or
				not minetest.registered_nodes[minetest.get_node(pt2).name].buildable_to or
				not placer or
				not placer:is_player()
			then
				return itemstack
			end

			if minetest.is_protected(pt, placer:get_player_name()) or
					minetest.is_protected(pt2, placer:get_player_name()) then
				minetest.record_protection_violation(pt, placer:get_player_name())
				return itemstack
			end

			local p2 = minetest.dir_to_facedir(placer:get_look_dir())
			local pt3 = {x=pt.x, y=pt.y, z=pt.z}
			if p2 == 0 then
				pt3.x = pt3.x-1
			elseif p2 == 1 then
				pt3.z = pt3.z+1
			elseif p2 == 2 then
				pt3.x = pt3.x+1
			elseif p2 == 3 then
				pt3.z = pt3.z-1
			end
			if minetest.get_item_group(minetest.get_node(pt3).name, "door") == 0 then
				minetest.set_node(pt, {name=name.."_b_1", param2=p2})
				minetest.set_node(pt2, {name=name.."_t_1", param2=p2})
			else
				minetest.set_node(pt, {name=name.."_b_2", param2=p2})
				minetest.set_node(pt2, {name=name.."_t_2", param2=p2})
				minetest.get_meta(pt):set_int("right", 1)
				minetest.get_meta(pt2):set_int("right", 1)
			end

			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end,
	})

	local tt = def.tiles_top
	local tb = def.tiles_bottom

	local function after_dig_node(pos, name, digger)
		local node = minetest.get_node(pos)
		if node.name == name then
			minetest.node_dig(pos, node, digger)
		end
	end

	local function on_rightclick(pos, dir, check_name, replace, replace_dir, params)
		pos.y = pos.y+dir
		if minetest.get_node(pos).name ~= check_name then
			return
		end
		local p2 = minetest.get_node(pos).param2
		p2 = params[p2+1]

		minetest.swap_node(pos, {name=replace_dir, param2=p2})

		pos.y = pos.y-dir
		minetest.swap_node(pos, {name=replace, param2=p2})

		local snd_1 = def.sound_close_door
		local snd_2 = def.sound_open_door
		if params[1] == 3 then
			snd_1 = def.sound_open_door
			snd_2 = def.sound_close_door
		end

		if minetest.get_meta(pos):get_int("right") ~= 0 then
			minetest.sound_play(snd_1, {pos = pos, gain = 0.3, max_hear_distance = 10})
		else
			minetest.sound_play(snd_2, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
	end

	local function on_rotate(pos, node, dir, user, check_name, mode, new_param2)

		if mode ~= screwdriver.ROTATE_FACE then
			return false
		end

		pos.y = pos.y + dir
		if not minetest.get_node(pos).name == check_name then
			return false
		end
		if minetest.is_protected(pos, user:get_player_name()) then
			minetest.record_protection_violation(pos, user:get_player_name())
			return false
		end

		local node2 = minetest.get_node(pos)
		node2.param2 = (node2.param2 + 1) % 4
		minetest.swap_node(pos, node2)

		pos.y = pos.y - dir
		node.param2 = (node.param2 + 1) % 4
		minetest.swap_node(pos, node)
		return true
	end

	minetest.register_node(name.."_b_1", {
		tiles = {tb[2], tb[2], tb[2], tb[2], tb[1], tb[1].."^[transformfx"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		drop = name,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = def.node_box_bottom
		},
		selection_box = {
			type = "fixed",
			fixed = def.selection_box_bottom
		},
		groups = def.groups,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			pos.y = pos.y+1
			after_dig_node(pos, name.."_t_1", digger)
		end,

		on_rightclick = function(pos, node, clicker)
			if not minetest.is_protected(pos, clicker:get_player_name()) then
				on_rightclick(pos, 1, name.."_t_1", name.."_b_2", name.."_t_2", {1,2,3,0})
			end
		end,

		on_rotate = function(pos, node, user, mode, new_param2)
			return on_rotate(pos, node, 1, user, name.."_t_1", mode)
		end,

		sounds = def.sounds,
		sunlight_propagates = def.sunlight,
		on_blast = function() end,
	})

	minetest.register_node(name.."_t_1", {
		tiles = {tt[2], tt[2], tt[2], tt[2], tt[1], tt[1].."^[transformfx"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		drop = "",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = def.node_box_top
		},
		selection_box = {
			type = "fixed",
			fixed = def.selection_box_top
		},
		groups = def.groups,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			pos.y = pos.y-1
			after_dig_node(pos, name.."_b_1", digger)
		end,

		on_rightclick = function(pos, node, clicker)
			if not minetest.is_protected(pos, clicker:get_player_name()) then
				on_rightclick(pos, -1, name.."_b_1", name.."_t_2", name.."_b_2", {1,2,3,0})
			end
		end,

		on_rotate = function(pos, node, user, mode, new_param2)
			return on_rotate(pos, node, -1, user, name.."_b_1", mode)
		end,

		sounds = def.sounds,
		sunlight_propagates = def.sunlight,
		on_blast = function() end,
	})

	minetest.register_node(name.."_b_2", {
		tiles = {tb[2], tb[2], tb[2], tb[2], tb[1].."^[transformfx", tb[1]},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		drop = name,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = def.node_box_bottom
		},
		selection_box = {
			type = "fixed",
			fixed = def.selection_box_bottom
		},
		groups = def.groups,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			pos.y = pos.y+1
			after_dig_node(pos, name.."_t_2", digger)
		end,

		on_rightclick = function(pos, node, clicker)
			if not minetest.is_protected(pos, clicker:get_player_name()) then
				on_rightclick(pos, 1, name.."_t_2", name.."_b_1", name.."_t_1", {3,0,1,2})
			end
		end,

		on_rotate = function(pos, node, user, mode, new_param2)
			return on_rotate(pos, node, 1, user, name.."_t_2", mode)
		end,

		sounds = def.sounds,
		sunlight_propagates = def.sunlight,
		on_blast = function() end,
	})

	minetest.register_node(name.."_t_2", {
		tiles = {tt[2], tt[2], tt[2], tt[2], tt[1].."^[transformfx", tt[1]},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		drop = "",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = def.node_box_top
		},
		selection_box = {
			type = "fixed",
			fixed = def.selection_box_top
		},
		groups = def.groups,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			pos.y = pos.y-1
			after_dig_node(pos, name.."_b_2", digger)
		end,

		on_rightclick = function(pos, node, clicker)
			if not minetest.is_protected(pos, clicker:get_player_name()) then
				on_rightclick(pos, -1, name.."_b_2", name.."_t_1", name.."_b_1", {3,0,1,2})
			end
		end,

		on_rotate = function(pos, node, user, mode, new_param2)
			return on_rotate(pos, node, -1, user, name.."_b_2", mode)
		end,

		sounds = def.sounds,
		sunlight_propagates = def.sunlight,
		on_blast = function() end,
	})

end

minetest.register_chatcommand("delprot", {
	params = "",
	description = S("Remove Protectors near players with names provided (separate names with spaces)"),
	privs = {server = true},
	func = function(name, param)

		if not param or param == "" then

			minetest.chat_send_player(name,
				S("Protector Names to remove: %1",
				protector.removal_names))

			return
		end

		if param == "-" then
			minetest.chat_send_player(name,
				S("Name List Reset"))

			protector.removal_names = ""

			return
		end

		protector.removal_names = param

	end,
})

minetest.register_abm({
	nodenames = {"custom:protect", "custom:protect2"},
	interval = 8,
	chance = 1,
	catch_up = false,
	action = function(pos, node)

		if protector.removal_names == "" then
			return
		end

		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		--local members = meta:get_string("members")

		local names = protector.removal_names:split(" ")

		for _, n in pairs(names) do

			if n == owner then
				minetest.set_node(pos, {name = "air"})
			end

		end

	end
})

-- check formspec buttons or when name entered
minetest.register_on_player_receive_fields(function(player, formname, fields)

	-- protector formspec found
	if string.sub(formname, 0, string.len("custom:node_")) == "custom:node_" then

		local pos_s = string.sub(formname, string.len("custom:node_") + 1)
		local pos = minetest.string_to_pos(pos_s)
		local meta = minetest.get_meta(pos)

		-- only owner can add names
		if not protector.can_dig(1, pos, player:get_player_name(), true, 1) then
			return
		end

		-- add member [+]
		if fields.protector_add_member then

			for _, i in pairs(fields.protector_add_member:split(" ")) do
				protector.add_member(meta, i)
			end
		end

		-- remove member [x]
		for field, value in pairs(fields) do

			if string.sub(field, 0,
				string.len("protector_del_member_")) == "protector_del_member_" then

				protector.del_member(meta,
					string.sub(field,string.len("protector_del_member_") + 1))
			end
		end

		-- reset formspec until close button pressed
		if not fields.close_me then
			minetest.show_formspec(player:get_player_name(), formname, protector.generate_formspec(meta))
		end
	end
end)

-- Protected Chest formspec buttons
minetest.register_on_player_receive_fields(function(player, formname, fields)

	if string.sub(formname, 0, string.len("custom:protected_chest_")) == "custom:protected_chest_" then

		local pos_s = string.sub(formname,string.len("custom:protected_chest_") + 1)
		local pos = minetest.string_to_pos(pos_s)
		local meta = minetest.get_meta(pos)
		local chest_inv = meta:get_inventory()
		local player_inv = player:get_inventory()
		local leftover

		if fields.toup then

			-- copy contents of players inventory to chest
			for i, v in pairs (player_inv:get_list("main") or {}) do

				if chest_inv
				and chest_inv:room_for_item('main', v) then

					leftover = chest_inv:add_item('main', v)

					player_inv:remove_item("main", v)

					if leftover
					and not leftover:is_empty() then
						player_inv:add_item("main", v)
					end
				end
			end

		elseif fields.todn then

			-- copy contents of chest to players inventory
			for i, v in pairs (chest_inv:get_list('main') or {}) do

				if player_inv:room_for_item("main", v) then

					leftover = player_inv:add_item("main", v)

					chest_inv:remove_item('main', v)

					if leftover
					and not leftover:is_empty() then
						chest_inv:add_item('main', v)
					end
				end
			end

		elseif fields.chestname then

			-- change chest infotext to display name
			if fields.chestname ~= "" then

				meta:set_string("name", fields.chestname)
				meta:set_string("infotext",
				S("Protected Chest (@1)", fields.chestname))
			else
				meta:set_string("infotext", S("Protected Chest"))
			end

		end
	end

end)

-- disables PVP in your own protected areas
if minetest.setting_getbool("enable_pvp") and protector.pvp then

	if minetest.register_on_punchplayer then

		minetest.register_on_punchplayer(
		function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)

			if not player
			or not hitter then
				print(S("[Protector] on_punchplayer called with nil objects"))
			end

			if not hitter:is_player() then
				return false
			end

			-- no pvp at spawn area
			local pos = player:getpos()

			if pos.x < statspawn.x + protector.spawn
			and pos.x > statspawn.x - protector.spawn
			and pos.y < statspawn.y + protector.spawn
			and pos.y > statspawn.y - protector.spawn
			and pos.z < statspawn.z + protector.spawn
			and pos.z > statspawn.z - protector.spawn then
				return true
			end

			if minetest.is_protected(pos, hitter:get_player_name()) then
				return true
			else
				return false
			end

		end)
	else
		print(S("[Protector] pvp_protect not active, update your version of Minetest"))

	end
else
	print(S("[Protector] pvp_protect is disabled"))
end



print (S("[MOD] Protector Redo loaded"))
