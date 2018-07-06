

-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})

minetest.register_tool("custom:pick_wood", {
	description = "Wooden Pickaxe",
	inventory_image = "custom_tool_woodpick.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {flammable = 2},
	sound = {breaks = "custom_tool_breaks"},
})

minetest.register_craft({
	output = 'custom:pick_wood',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:pick_wood",
	burntime = 6,
})

minetest.register_tool("custom:pick_stone", {
	description = "Stone Pickaxe",
	inventory_image = "custom_tool_stonepick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:pick_stone',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_tool("custom:pick_steel", {
	description = "Steel Pickaxe",
	inventory_image = "custom_tool_steelpick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:pick_steel',
	recipe = {
		{'custom:steel_ingot', 'custom:steel_ingot', 'custom:steel_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_tool("custom:pick_bronze", {
	description = "Bronze Pickaxe",
	inventory_image = "custom_tool_bronzepick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:pick_bronze',
	recipe = {
		{'custom:bronze_ingot', 'custom:bronze_ingot', 'custom:bronze_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_tool("custom:pick_mese", {
	description = "Mese Pickaxe",
	inventory_image = "custom_tool_mesepick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:pick_mese',
	recipe = {
		{'custom:mese_crystal', 'custom:mese_crystal', 'custom:mese_crystal'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_tool("custom:pick_diamond", {
	description = "Diamond Pickaxe",
	inventory_image = "custom_tool_diamondpick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:pick_diamond',
	recipe = {
		{'custom:diamond', 'custom:diamond', 'custom:diamond'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_tool("custom:shovel_wood", {
	description = "Wooden Shovel",
	inventory_image = "custom_tool_woodshovel.png",
	wield_image = "custom_tool_woodshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {flammable = 2},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:shovel_wood',
	recipe = {
		{'group:wood'},
		{'group:stick'},
		{'group:stick'},
	}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:shovel_wood",
	burntime = 4,
})

minetest.register_tool("custom:shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "custom_tool_stoneshovel.png",
	wield_image = "custom_tool_stoneshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:shovel_stone',
	recipe = {
		{'group:stone'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_tool("custom:shovel_steel", {
	description = "Steel Shovel",
	inventory_image = "custom_tool_steelshovel.png",
	wield_image = "custom_tool_steelshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:shovel_steel',
	recipe = {
		{'custom:steel_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_tool("custom:shovel_bronze", {
	description = "Bronze Shovel",
	inventory_image = "custom_tool_bronzeshovel.png",
	wield_image = "custom_tool_bronzeshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:shovel_bronze',
	recipe = {
		{'custom:bronze_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_tool("custom:shovel_mese", {
	description = "Mese Shovel",
	inventory_image = "custom_tool_meseshovel.png",
	wield_image = "custom_tool_meseshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:shovel_mese',
	recipe = {
		{'custom:mese_crystal'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_tool("custom:shovel_diamond", {
	description = "Diamond Shovel",
	inventory_image = "custom_tool_diamondshovel.png",
	wield_image = "custom_tool_diamondshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:shovel_diamond',
	recipe = {
		{'custom:diamond'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_tool("custom:axe_wood", {
	description = "Wooden Axe",
	inventory_image = "custom_tool_woodaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[2]=3.00, [3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {flammable = 2},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:wood', 'group:stick'},
		{'', 'group:stick'},
	}
})
minetest.register_craft({
	output = 'custom:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:stick', 'group:wood'},
		{'group:stick',''},
	}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:axe_wood",
	burntime = 6,
})

minetest.register_tool("custom:axe_stone", {
	description = "Stone Axe",
	inventory_image = "custom_tool_stoneaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stone', 'group:stick'},
		{'', 'group:stick'},
	}
})
minetest.register_craft({
	output = 'custom:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stick', 'group:stone'},
		{'group:stick', ''},
	}
})

minetest.register_tool("custom:axe_steel", {
	description = "Steel Axe",
	inventory_image = "custom_tool_steelaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:axe_steel',
	recipe = {
		{'custom:steel_ingot', 'custom:steel_ingot'},
		{'custom:steel_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})
minetest.register_craft({
	output = 'custom:axe_steel',
	recipe = {
		{'custom:steel_ingot', 'custom:steel_ingot'},
		{'group:stick', 'custom:steel_ingot'},
		{'group:stick', ''},
	}
})

minetest.register_tool("custom:axe_bronze", {
	description = "Bronze Axe",
	inventory_image = "custom_tool_bronzeaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:axe_bronze',
	recipe = {
		{'custom:bronze_ingot', 'custom:bronze_ingot'},
		{'custom:bronze_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})
minetest.register_craft({
	output = 'custom:axe_bronze',
	recipe = {
		{'custom:bronze_ingot', 'custom:bronze_ingot'},
		{'group:stick', 'custom:bronze_ingot'},
		{'group:stick', ''},
	}
})

minetest.register_tool("custom:axe_mese", {
	description = "Mese Axe",
	inventory_image = "custom_tool_meseaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:axe_mese',
	recipe = {
		{'custom:mese_crystal', 'custom:mese_crystal'},
		{'custom:mese_crystal', 'group:stick'},
		{'', 'group:stick'},
	}
})
minetest.register_craft({
	output = 'custom:axe_mese',
	recipe = {
		{'custom:mese_crystal', 'custom:mese_crystal'},
		{'group:stick', 'custom:mese_crystal'},
		{'group:stick', ''},
	}
})

minetest.register_tool("custom:axe_diamond", {
	description = "Diamond Axe",
	inventory_image = "custom_tool_diamondaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:axe_diamond',
	recipe = {
		{'custom:diamond', 'custom:diamond'},
		{'custom:diamond', 'group:stick'},
		{'', 'group:stick'},
	}
})
minetest.register_craft({
	output = 'custom:axe_diamond',
	recipe = {
		{'custom:diamond', 'custom:diamond'},
		{'group:stick', 'custom:diamond'},
		{'group:stick', ''},
	}
})

minetest.register_tool("custom:sword_wood", {
	description = "Wooden Sword",
	inventory_image = "custom_tool_woodsword.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {flammable = 2},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:sword_wood',
	recipe = {
		{'group:wood'},
		{'group:wood'},
		{'group:stick'},
	}
})
minetest.register_craft({
	type = "fuel",
	recipe = "custom:sword_wood",
	burntime = 5,
})

minetest.register_tool("custom:sword_stone", {
	description = "Stone Sword",
	inventory_image = "custom_tool_stonesword.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:sword_stone',
	recipe = {
		{'group:stone'},
		{'group:stone'},
		{'group:stick'},
	}
})

minetest.register_tool("custom:sword_steel", {
	description = "Steel Sword",
	inventory_image = "custom_tool_steelsword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:sword_steel',
	recipe = {
		{'custom:steel_ingot'},
		{'custom:steel_ingot'},
		{'group:stick'},
	}
})

minetest.register_tool("custom:sword_bronze", {
	description = "Bronze Sword",
	inventory_image = "custom_tool_bronzesword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:sword_bronze',
	recipe = {
		{'custom:bronze_ingot'},
		{'custom:bronze_ingot'},
		{'group:stick'},
	}
})

minetest.register_tool("custom:sword_mese", {
	description = "Mese Sword",
	inventory_image = "custom_tool_mesesword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:sword_mese',
	recipe = {
		{'custom:mese_crystal'},
		{'custom:mese_crystal'},
		{'group:stick'},
	}
})

minetest.register_tool("custom:sword_diamond", {
	description = "Diamond Sword",
	inventory_image = "custom_tool_diamondsword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
		range = 4.0,
	},
	sound = {breaks = "custom_tool_breaks"},
})
minetest.register_craft({
	output = 'custom:sword_diamond',
	recipe = {
		{'custom:diamond'},
		{'custom:diamond'},
		{'group:stick'},
	}
})


--[[
-- Removed from game for two reasons:
-- 1 - Not really needed since we have protected chests and doors
-- 2 - Wrazhevsky said that the key will dig doors

minetest.register_tool("custom:skeleton_key", {
	description = "Skeleton Key",
	inventory_image = "custom_key_skeleton.png",
	groups = {key = 1},
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local pos = pointed_thing.under
		local node = minetest.get_node(pos)

		if not node then
			return itemstack
		end

		local on_skeleton_key_use = minetest.registered_nodes[node.name].on_skeleton_key_use
		if on_skeleton_key_use then
			-- make a new key secret in case the node callback needs it
			local random = math.random
			local newsecret = string.format(
				"%04x%04x%04x%04x",
				random(2^16) - 1, random(2^16) - 1,
				random(2^16) - 1, random(2^16) - 1)

			local secret, _, _ = on_skeleton_key_use(pos, placer, newsecret)

			if secret then
				-- finish and return the new key
				itemstack:take_item()
				itemstack:add_item("custom:key")
				itemstack:set_metadata(minetest.write_json({
					secret = secret
				}))
				return itemstack
			end
		end
		return nil
	end
})
minetest.register_craft({
	output = 'custom:skeleton_key',
	recipe = {
		{'custom:gold_ingot'},
	}
})
minetest.register_craft({
	type = 'cooking',
	output = 'custom:gold_ingot',
	recipe = 'custom:skeleton_key',
	cooktime = 5,
})


minetest.register_tool("custom:key", {
	description = "Key",
	inventory_image = "custom_key.png",
	groups = {key = 1, not_in_creative_inventory = 1},
	stack_max = 1,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local pos = pointed_thing.under
		local node = minetest.get_node(pos)

		if not node or node.name == "ignore" then
			return itemstack
		end

		local ndef = minetest.registered_nodes[node.name]
		if not ndef then
			return itemstack
		end

		local on_key_use = ndef.on_key_use
		if on_key_use then
			on_key_use(pos, placer)
		end

		return nil
	end
})
minetest.register_craft({
	type = 'cooking',
	output = 'custom:gold_ingot',
	recipe = 'custom:key',
	cooktime = 5,
})

--]]
