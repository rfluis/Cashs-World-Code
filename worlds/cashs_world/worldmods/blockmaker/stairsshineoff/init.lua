-- A slightly modified stairs mod to make stairs able to shine a light
-- Includes also original text and README.txt
-- Credits to Kahrl and celeron55

-- Minetest 0.4 mod: stairsshineoff
-- See README.txt for licensing and other information.

-- Global namespace for functions

stairsshineoff = {}

-- Register stairs
-- Node will be called stairsshineoff:stair_<subname>

-- Somehow the meshdrawtype makes the coloredlightblocks stairs invisible so changed it back to nodebox

 function stairsshineoff.register_stair(subname, recipeitem, groups, images, description, drop, sounds, mesecons)
	groups.stair = 1
	minetest.register_node(":stairsshineoff:stair_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		mesecons = mesecons,
		drop = drop,
		sounds = sounds,
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

			if p0.y - 1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,

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

	-- end rnd basic machine code

	})
end

-- No need to craft both on and off so removed the crafting

-- Register slabs
-- Node will be called stairsshineoff:slab_<subname>

function stairsshineoff.register_slab(subname, recipeitem, groups, images, description, drop, sounds, mesecons)
	groups.slab = 1
	minetest.register_node(":stairsshineoff:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		mesecons = mesecons,
		drop = drop,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			-- If it's being placed on an another similar one, replace it with
			-- a full block
			local slabpos = nil
			local slabnode = nil
			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local n0 = minetest.get_node(p0)
			local n1 = minetest.get_node(p1)
			local param2 = 0

			local n0_is_upside_down = (n0.name == "stairsshineoff:slab_" .. subname and
					n0.param2 >= 20)

			if n0.name == "stairsshineoff:slab_" .. subname and not n0_is_upside_down and
					p0.y + 1 == p1.y then
				slabpos = p0
				slabnode = n0
			elseif n1.name == "stairsshineoff:slab_" .. subname then
				slabpos = p1
				slabnode = n1
			end
			if slabpos then
				-- Remove the slab at slabpos
				minetest.remove_node(slabpos)
				-- Make a fake stack of a single item and try to place it
				local fakestack = ItemStack(recipeitem)
				fakestack:set_count(itemstack:get_count())

				pointed_thing.above = slabpos
				local success
				fakestack, success = minetest.item_place(fakestack, placer,
					pointed_thing)
				-- If the item was taken from the fake stack, decrement original
				if success then
					itemstack:set_count(fakestack:get_count())
				-- Else put old node back
				else
					minetest.set_node(slabpos, slabnode)
				end
				return itemstack
			end
			
			-- Upside down slabs
			if p0.y - 1 == p1.y then
				-- Turn into full block if pointing at a existing slab
				if n0_is_upside_down  then
					-- Remove the slab at the position of the slab
					minetest.remove_node(p0)
					-- Make a fake stack of a single item and try to place it
					local fakestack = ItemStack(recipeitem)
					fakestack:set_count(itemstack:get_count())

					pointed_thing.above = p0
					local success
					fakestack, success = minetest.item_place(fakestack, placer,
						pointed_thing)
					-- If the item was taken from the fake stack, decrement original
					if success then
						itemstack:set_count(fakestack:get_count())
					-- Else put old node back
					else
						minetest.set_node(p0, n0)
					end
					return itemstack
				end

				-- Place upside down slab
				param2 = 20
			end

			-- If pointing at the side of a upside down slab
			if n0_is_upside_down and p0.y + 1 ~= p1.y then
				param2 = 20
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,

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

	-- end rnd basic machine code

	})
end

-- And again no crafting needed

-- Stair/slab registration function.
-- Nodes will be called stairsshineoff:{stair,slab}_<subname>

function stairsshineoff.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, sounds, mesecons)
	stairsshineoff.register_stair(subname, recipeitem, groups, images, desc_stair, sounds, mesecons)
	stairsshineoff.register_slab(subname, recipeitem, groups, images, desc_slab, sounds, mesecons)
end