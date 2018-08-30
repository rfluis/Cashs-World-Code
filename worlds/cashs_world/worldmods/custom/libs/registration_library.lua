-- Every possible thing in a MineTest world is one of the following:
-- Node - These are items that can be placed in the world by right-clicking.
-- Mob - Monsters or other creatures.
-- Tool - Items that players can use.
-- Craft_Item - These are things that can not be placed into a world. They can only be transferred
--              between players, placed in chests, used as fuel, or used in crafting recipes.

-- This file registers each item with the MineTest server.

-- Need the ability to select one of possibly many different
-- functions that perform the same task.
-- Example: Mobs might behave differently and require different functions
-- Maybe label these functions: on_place1, on_place2, on_destruct1, on_destruct2, etc


--[[ Register an item
-- Call the appropriate MineTest register function based on what the item is.
-- Need to insert error checking code
--]]
function RegisterItem (Item_Info, Item_Def, Item_Recipes)

--    local Params = Handle
    -- Need an if statement to register normal craft also. Huh, what does this mean?

    if Item_Info.Name == nil then
        print("ERROR: [MOD]Custom: " .. "Item has no name! Bad or missing Info field in definition file.")
    end

    if Item_Info.Type == nil then
        print("ERROR: [MOD]Custom: " .. Item_Info.Name .. " has not been given a type! Bad Info field in definition file.")
    end

    if Item_Info.Type == "craft_item" then
        minetest.register_craftitem(modname .. ":" .. Item_Info.Name, (Item_Def))
    print("[MOD]Custom: Registered craft_item: " .. modname .. ":" .. Item_Info.Name)
    end

    if Item_Info.Type == "tool" then
        minetest.register_tool(modname .. ":" .. Item_Info.Name, (Item_Def))
    print("[MOD]Custom: Registered tool: " .. modname .. ":" .. Item_Info.Name)
    end

    if Item_Info.Type == "node" then
        minetest.register_node(modname .. ":" .. Item_Info.Name, (Item_Def))
    print("[MOD]Custom: Registered node: " .. modname .. ":" .. Item_Info.Name)
    end

-- Multiple recipes are allowed
    if Item_Recipes.Number_Recipes ~= nil and Item_Recipes.Number_Recipes ~= 0 then
        for i=1,Item_Recipes.Number_Recipes do
            -- Two methods required because 'Shaped' is not defined by the developers
            if Item_Recipes.Shapeless[i] == true then
                minetest.register_craft({
                    type = "shapeless",
                    output = modname .. ":" .. Item_Info.Name .. " " .. Item_Recipes.Quantity[i],
                    recipe = Item_Recipes.Formula[i],
                    replacements = Item_Recipes.Replacements[i],
                })
                print("[MOD]Custom: Registered shapeless recipe for: " .. modname .. ":" .. Item_Info.Name)
            else
                minetest.register_craft({
                    type = nil,
                    output = modname .. ":" .. Item_Info.Name .. " " .. Item_Recipes.Quantity[i],
                    recipe = Item_Recipes.Formula[i],
                    replacements = Item_Recipes.Replacements[i],
                })
                print("[MOD]Custom: Registered shaped recipe for: " .. modname .. ":" .. Item_Info.Name)
            end
        end
    end

-- Is this item cookable in a furnace?
-- PROBLEM: This does not allow for getting more than one item out of each item cooked
    if Item_Recipes.Cook_Time ~= nil and Item_Recipes.Cook_Time ~= 0 then
        minetest.register_craft({
        type = "cooking",
        output = Item_Recipes.Cooking_Output,
        recipe = modname .. ":" .. Item_Info.Name,
        cooktime = Item_Recipes.Cook_Time,
        })
        print("[MOD]Custom: Registered cooking recipe for: " .. modname .. ":" .. Item_Info.Name)
    end

-- Can this item be used as fuel in a furnace?
    if Item_Recipes.Burn_Time ~= nil and Item_Recipes.Burn_Time ~= 0 then
        minetest.register_craft({
        type = "fuel",
        recipe = modname .. ":" .. Item_Info.Name,
        burntime = Item_Recipes.Burn_Time,
        })
        print("[MOD]Custom: Registered fuel: " .. modname .. ":" .. Item_Info.Name)
    end

--[[ I really don't see a use for this function
While I think it can be defined multiple times
it seems to be a global function. IOW the last definition
applies the value to every tool. Not verified.
    if Additional_Wear ~= 0 then
        minetest.register_craft({
            type = "toolrepair",
            additional_wear = Additional_Wear,
        })
    end
--]]

--[[
-- If the item does not have a Forms field, skip everything below this line
if (Item_Forms == nil) then
    print("Forms = nil. Done with: " .. Item_Info.Name)
    return
end

-- Make stairs for this item?
if Item_Forms.Stairs ~= nil and Item_Forms.Stairs == true then
	minetest.register_node(modname .. ":" .. "stair_" .. Item_Info.Name, {
		description = Item_Def.description .. " stairs",
		drawtype = "nodebox",
		tiles = Item_Def.tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = Item_Def.is_ground_content,
		groups = Item_Def.groups,
		sounds = Item_Def.sound,
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
	})

    print("[MOD]Custom: Registered node: " .. "stair_" .. Item_Info.Name)

    minetest.register_craft({
		output = modname .. ":" .. "stair_" .. Item_Info.Name .. ' 8',
		recipe = {
			{modname .. ":" .. Item_Info.Name, "", ""},
			{modname .. ":" .. Item_Info.Name, modname .. ":" .. Item_Info.Name, ""},
			{modname .. ":" .. Item_Info.Name, modname .. ":" .. Item_Info.Name, modname .. ":" .. Item_Info.Name},
		},
	})

	-- Flipped recipe for the silly minecrafters
	minetest.register_craft({
		output = modname .. ":" .. "stair_" .. Item_Info.Name.. ' 8',
		recipe = {
			{"", "", modname .. ":" .. Item_Info.Name},
			{"", modname .. ":" .. Item_Info.Name, modname .. ":" .. Item_Info.Name},
			{modname .. ":" .. Item_Info.Name, modname .. ":" .. Item_Info.Name, modname .. ":" .. Item_Info.Name},
		},
	})

	-- Fuel
	local baseburntime = minetest.get_craft_result({
		method = "fuel",
		width = 1,
		items = {modname .. ":" .. Item_Info.Name}
	}).time
	if baseburntime > 0 then
		minetest.register_craft({
			type = "fuel",
			recipe = modname .. ":" .. "stair_" .. Item_Info.Name,
			burntime = math.floor(baseburntime * 0.75),
		})
	end
end

if Item_Forms.Slab ~= nil and Item_Forms.Slab == true then

    -- Slab facedir to placement 6d matching table
    local slab_trans_dir = {[0] = 8, 0, 2, 1, 3, 4}
    -- Slab facedir when placing initial slab against other surface
    local slab_trans_dir_place = {[0] = 0, 20, 12, 16, 4, 8}

	minetest.register_node(modname .. ":" .. "slab_" .. Item_Info.Name, {
		description = Item_Def.description ..  " stairs",
		drawtype = "nodebox",
		tiles = Item_Def.tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = Item_Def.is_ground_content,
		groups = Item_Def.groups,
		sounds = Item_Def.sound,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			local wield_item = itemstack:get_name()

			if under and wield_item == under.name then
				-- place slab using under node orientation
				local dir = minetest.dir_to_facedir(vector.subtract(
					pointed_thing.above, pointed_thing.under), true)

				local p2 = under.param2

				-- combine two slabs if possible
				if slab_trans_dir[math.floor(p2 / 4)] == dir then
					if not modname .. ":" .. Item_Info.Name then
						return itemstack
					end
					local player_name = placer:get_player_name()
					if minetest.is_protected(pointed_thing.under, player_name) and not
							minetest.check_player_privs(placer, "protection_bypass") then
						minetest.record_protection_violation(pointed_thing.under,
							player_name)
						return
					end
					minetest.set_node(pointed_thing.under, {name = modname .. ":" .. Item_Info.Name, param2 = p2})
					if not minetest.setting_getbool("creative_mode") then
						itemstack:take_item()
					end
					return itemstack
				end

				-- Placing a slab on an upside down slab should make it right-side up.
				if p2 >= 20 and dir == 8 then
					p2 = p2 - 20
				-- same for the opposite case: slab below normal slab
				elseif p2 <= 3 and dir == 4 then
					p2 = p2 + 20
				end

				-- else attempt to place node with proper param2
				minetest.item_place_node(ItemStack(wield_item), placer, pointed_thing, p2)
				if not minetest.setting_getbool("creative_mode") then
					itemstack:take_item()
				end
				return itemstack
			else
				-- place slab using look direction of player
				local dir = minetest.dir_to_wallmounted(vector.subtract(
					pointed_thing.above, pointed_thing.under), true)

				local rot = slab_trans_dir_place[dir]
				if rot == 0 or rot == 20 then
					rot = rot + minetest.dir_to_facedir(placer:get_look_dir())
				end

				return minetest.item_place(itemstack, placer, pointed_thing, rot)
			end
		end,
	})

    print("[MOD]Custom: Registered node: " .. "slab_" .. Item_Info.Name)

	minetest.register_craft({
		output = modname .. ":" .. "slab_" .. Item_Info.Name .. ' 6',
		recipe = {
			{modname .. ":" .. Item_Info.Name, modname .. ":" .. Item_Info.Name, modname .. ":" .. Item_Info.Name},
		},
	})

	-- Fuel
	local baseburntime = minetest.get_craft_result({
		method = "fuel",
		width = 1,
		items = {modname .. ":" .. Item_Info.Name}
	}).time
	if baseburntime > 0 then
		minetest.register_craft({
			type = "fuel",
			recipe = modname .. ":" .. "slab_" .. Item_Info.Name,
			burntime = math.floor(baseburntime * 0.5),
		})
	end
end

if (Item_Forms.Fence[Flag] ~= nil and Item_Forms.Fence[Flag] ~= false) then


This should work for metals, woods, etc

alias tree to apple_tree
alias default:wood to custom:apple_wood
alias sapling to custom:apple_tree_sapling
alias leaves to custom:apple_tree_leaves
alias junglewood to custom:jungle_wood

wood
junglewood
pine_wood
acacia_wood
aspen_wood

	local fence_texture = "custom_fence_overlay.png^" .. Item_Forms.Fence[Texture] ..
			"^custom_fence_overlay.png^[makealpha:255,126,126"
	-- Always add to the fence group, even if no group provided
    Item_Def.groups[fence] = 1

	minetest.register_node(modname .. ":" .. "fence_" .. Item_Forms.Fence[Subname], {
		description = Item_Forms.Fence[Desc],
		inventory_image = fence_texture,
		wield_image = fence_texture,
--		drawtype = "fencelike",
		drawtype = "nodebox",
		tiles = Item_Forms.Fence[Texture],
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
				{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
			connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
				{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
			connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
				{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
			connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
				{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
		},
		connects_to = {"group:fence", "group:wood", "group:tree"},
		is_ground_content = false,
		sunlight_propagates = true,
		groups = Item_Forms.Fence[groups],
		sounds = Item_Forms.Fence[sound],
    })

    print("[MOD]Custom: Registered node: " .. "fence_" .. Item_Forms.Fence[Subname])

	minetest.register_craft({
		output = modname .. ":" .. "fence_" .. Item_Forms.Fence[Subname] .. " 4",
		recipe = {
			{ modname .. ":" .. Item_Info.Name, 'group:stick', modname .. ":" .. Item_Info.Name },
			{ modname .. ":" .. Item_Info.Name, 'group:stick', modname .. ":" .. Item_Info.Name },
		}
	})

end
--]]
print("Done with: " .. Item_Info.Name)
end
