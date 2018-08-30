
--falling = falling or {}
--falling.modpath = minetest.get_modpath("falling")



minetest.register_entity(":__builtin:falling_node", {
	initial_properties = {
		visual = "wielditem",
		visual_size = {x = 0.667, y = 0.667},
		textures = {},
		physical = true,
		is_visible = false,
		collide_with_objects = false,
		collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},

	node = {},

	set_node = function(self, node)
		self.node = node
		self.object:set_properties({
			is_visible = true,
			textures = {node.name},
		})
	end,

	get_staticdata = function(self)
		return core.serialize(self.node)
	end,

	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal = 1})

		local node = core.deserialize(staticdata)
		if node then
			self:set_node(node)
		elseif staticdata ~= "" then
			self:set_node({name = staticdata})
		end
	end,

	on_step = function(self, dtime)
		-- Set gravity
		local acceleration = self.object:getacceleration()
		if not vector.equals(acceleration, {x = 0, y = -10, z = 0}) then
			self.object:setacceleration({x = 0, y = -10, z = 0})
		end
		-- Turn to actual node when colliding with ground, or continue to move
		local pos = self.object:getpos()
		-- Position of bottom center point
		local bcp = {x = pos.x, y = pos.y - 0.7, z = pos.z}
		-- Avoid bugs caused by an unloaded node below
		local bcn = core.get_node_or_nil(bcp)
		local bcd = bcn and core.registered_nodes[bcn.name]
		if bcn and
				(not bcd or bcd.walkable or
				(core.get_item_group(self.node.name, "float") ~= 0 and
				bcd.liquidtype ~= "none")) then
			if bcd and bcd.leveled and
					bcn.name == self.node.name then
				local addlevel = self.node.level
				if not addlevel or addlevel <= 0 then
					addlevel = bcd.leveled
				end
				if core.add_node_level(bcp, addlevel) == 0 then
					self.object:remove()
					return
				end
			elseif bcd and bcd.buildable_to and
					(core.get_item_group(self.node.name, "float") == 0 or
					bcd.liquidtype == "none") then
				core.remove_node(bcp)
				return
			end
			local np = {x = bcp.x, y = bcp.y + 1, z = bcp.z}
            local protected = minetest.is_protected(np, "")

			-- Check what's here
			local n2 = core.get_node(np)
			local nd = core.registered_nodes[n2.name]
			-- If it's not air or liquid, remove node and replace it with
			-- it's drops
			if n2.name ~= "air" and (not nd or nd.liquidtype == "none") then
                if not protected then
                    core.remove_node(np)
                    if nd.buildable_to == false then
                        -- Add dropped items
                        local drops = core.get_node_drops(n2.name, "")
                        for _, dropped_item in pairs(drops) do
                            core.add_item(np, dropped_item)
                        end
                    end
                    -- Run script hook
                    for _, callback in pairs(core.registered_on_dignodes) do
                        callback(np, n2)
                    end
                end
            end
			-- Create node and remove entity
			if core.registered_nodes[self.node.name] then
                if not protected or n2.name == "air" then
                    core.add_node(np, self.node)
                else
                    core.add_item(np, self.node)
                end
            end

			self.object:remove()
			core.check_for_falling(np)
            --nodeupdate(np)
			return
		end
		local vel = self.object:getvelocity()
		if vector.equals(vel, {x = 0, y = 0, z = 0}) then
			local npos = self.object:getpos()
			self.object:setpos(vector.round(npos))
		end
	end
})
