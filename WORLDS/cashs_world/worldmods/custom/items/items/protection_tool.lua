

-- protector placement tool (thanks to Shara for code and idea)
minetest.register_craftitem("custom:protection_tool", {
	description = "Protector Placer Tool (stand on protector, face direction and use) Needs an image!",
	inventory_image = "custom_screwdriver.png",
	stack_max = 1,

	on_use = function(itemstack, user, pointed_thing)

		local name = user:get_player_name()

		-- check node player occupies
		local pos = user:getpos()
		local nod = minetest.get_node(pos).name
		if nod ~= "custom:protect2" then
			-- check node under player
			pos.y = pos.y - 1
			nod = minetest.get_node(pos).name
			if nod ~= "custom:protect"
			and nod ~= "custom:protect2" then
				return
			end
		end

		-- get members on protector
		local meta = minetest.get_meta(pos)
		local members = meta:get_string("members") or ""

		-- get direction player is facing
		local dir = minetest.dir_to_facedir( user:get_look_dir() )
		local vec = {x = 0, y = 0, z = 0}
		local gap = (protector.radius * 2) + 1

		-- set placement coords
		if dir == 0 then
			vec.z = gap -- north
		elseif dir == 1 then
			vec.x = gap -- east
		elseif dir == 2 then
			vec.z = -gap -- south
		elseif dir == 3 then
			vec.x = -gap -- west
		end

		-- new position
		pos.x = pos.x + vec.x
		pos.y = pos.y + vec.y
		pos.z = pos.z + vec.z

		-- does placing a protector overlap existing area
		if not protector.can_dig(protector.radius * 2, pos,
			user:get_player_name(), true, 3) then

			minetest.chat_send_player(name,
				"Overlaps into above players protected area")

			return
		end

		-- does a protector already exist ?
		if #minetest.find_nodes_in_area(
			vector.subtract(pos, 1), vector.add(pos, 1),
			{"custom:protect", "custom:protect2"}) > 0 then

			minetest.chat_send_player(name, "Protector already in place!")
			return
		end

		-- do we have protectors to use ?
		local inv = user:get_inventory()

		if not inv:contains_item("main", "custom:protect")
		and not inv:contains_item("main", "custom:protect2") then
			minetest.chat_send_player(name, "No protectors available to place!")
			return
		end

		-- take protector
		if inv:contains_item("main", "custom:protect") then
			inv:remove_item("main", "custom:protect")
		elseif inv:contains_item("main", "custom:protect2") then
			inv:remove_item("main", "custom:protect2")
		end

		-- place protector
		minetest.set_node(pos, {name = nod, param2 = 1})

		-- set protector metadata
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", name)
		meta:set_string("infotext", "Protection (owned by " .. name .. ")")

		-- copy members across if holding sneak when using tool
		if user:get_player_control().sneak then
			meta:set_string("members", members)
		else
			meta:set_string("members", "")
		end

	end,
})
minetest.register_craft({
	output = "custom:protection_tool",
	recipe = {
		{"custom:steel_ingot", "custom:steel_ingot", "custom:steel_ingot"},
		{"custom:steel_ingot", "custom:protect", "custom:steel_ingot"},
		{"custom:steel_ingot", "custom:steel_ingot", "custom:steel_ingot"},
	}
})
