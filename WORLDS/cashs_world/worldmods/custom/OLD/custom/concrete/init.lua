-- minetest.register.node is used when am item can be placed in
--      the world as a node.

-- minetest.register.craft is used to register an item's recipe.

-- minetest.register.craftitem is used for items that can not be
--      placed in the world. Rebar can't be placed but is used
--      in recipes. An apple pie can be eaten but not placed.

concrete = {}

-- Rebar
minetest.register_craftitem(":custom:rebar", {
	description = ("Rebar"),
	inventory_image = "custom_rebar.png",
})
minetest.register_craft({
	output = 'custom:rebar 6',
	recipe = {
		{'','','custom:steel_ingot'},
		{'','custom:steel_ingot',''},
		{'custom:steel_ingot','',''},
	}
})

-- Truss
	minetest.register_node(":custom:truss", {
		description = "Truss",
		tiles = {"custom_truss.png"},
		drawtype = "nodebox",
		paramtype = "light",
		groups = {cracky = 2},
		node_box = {
			type = "fixed",
			fixed = {
				{1/2, -1/2, -1/2, 1/2, 1/2, 1/2},
				{-1/2, 1/2, -1/2, 1/2, 1/2, 1/2},
				{-1/2, -1/2, 1/2, 1/2, 1/2, 1/2},
				{-1/2, -1/2, -1/2, -1/2, 1/2, 1/2},
				{-1/2, -1/2, -1/2, 1/2, -1/2, 1/2},
				{-1/2, -1/2, -1/2, 1/2, 1/2, -1/2}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, 1/2, 1/2}
		}
	})
	minetest.register_craft({
		output = '"custom:truss" 5',
		recipe = {
			{'custom:steel_ingot', '', 'custom:steel_ingot'},
			{'', 'custom:steel_ingot', ''},
			{'custom:steel_ingot', '', 'custom:steel_ingot'}
		}
	})

-- Concrete Block
minetest.register_node(":custom:concrete", {
	description = ("Concrete Block"),
	tiles = {"custom_concrete_block.png"},
	groups = {cracky=1, level=2, concrete=1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craft({
	output = 'custom:concrete 4',
	recipe = {
		{'custom:gravel','custom:rebar','custom:gravel'},
		{'custom:rebar','custom:sand','custom:rebar'},
		{'custom:gravel','custom:rebar','custom:gravel'},
	}
})
minetest.register_craft({
	output = 'custom:concrete 4',
	recipe = {
		{'custom:gravel','custom:rebar','custom:gravel'},
		{'custom:rebar','custom:desert_sand','custom:rebar'},
		{'custom:gravel','custom:rebar','custom:gravel'},
	}
})

--[[
-- Concrete Stairs
	minetest.register_node(":custom:stair_concrete", {
		description = "Concrete Stairs",
		drawtype = "nodebox",
		tiles = {"custom_concrete_block.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		sounds = default.node_sound_stone_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
	minetest.register_craft({
		output = 'custom:stair_concrete 6',
		recipe = {
			{'custom:concrete', "", ""},
			{'custom:concrete', 'custom:concrete', ""},
			{'custom:concrete', 'custom:concrete', 'custom:concrete'},
		},
	})
	minetest.register_craft({
		output = 'custom:stair_concrete 6',
		recipe = {
			{"", "", 'custom:concrete'},
			{"", 'custom:concrete', 'custom:concrete'},
			{'custom:concrete', 'custom:concrete', 'custom:concrete'},
		},
	})

-- Concrete slabs
--]]

-- Nodes will be called stairs:{stair,slab}_<subname>
function concrete.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, sounds)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
end

concrete.register_stair_and_slab("concrete", "custom:concrete",
		{cracky=1,level=2, concrete=1},
		{"custom_concrete_block.png"},
		"Concrete Stair",
		"Concrete Slab",
		default.node_sound_stone_defaults())

