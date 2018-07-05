-- time how long this takes to do
local load_time_start = os.clock()

--[[
=====================================================================
** Custom **
By JDC
Copyright (c) 2015
=====================================================================
--]]

--[[
-- Print the version of the LUA interpreter
print(_VERSION)
-- Print out the module search path
print(package.path)
-- This will load the file testmodule.lua in bin\lua directory
mymodule = require "testmodule"
mymodule.print()
--]]

-- Until or unless I learn how to do this automatically, load each file manually

-- Set the name of this mod
modname = minetest.get_current_modname()

-- Add Internationalization
-- local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end


-- check that this mod exists in the proper location
local modpath = minetest.get_modpath(modname)
print("Modpath = " .. modpath)
local libpath = modpath .. ".?"
print("Libpath = " .. libpath)
package.path = package.path .. ";" .. modpath .. "/libs/?.lua"
-- libname = package.searchpath("libs.lib_ores", libpath)
print("package.path = " .. package.path)
-- print("Libname = " .. libname)
-- print(package.config)
-- require "lib_ores"


-- Load functions from libraries
dofile(modpath .. "/libs/registration_library.lua")
dofile(modpath .. "/libs/default_functions_library.lua")
dofile(modpath .. "/libs/doors_trapdoors_and_gates_library.lua")
dofile(modpath .. "/libs/beds_library.lua")
--dofile(modpath .. "/libs/sfinv_library.lua")
dofile(modpath .. "/libs/nyancat_library.lua")
dofile(modpath .. "/libs/carts_library.lua")
dofile(modpath .. "/libs/protection_library.lua")
--dofile(modpath .. "/libs/basic_machines_library.lua")
dofile(modpath .. "/libs/growing_things_library.lua")
dofile(modpath .. "/libs/stairs_library.lua")
dofile(modpath .. "/libs/fences_library.lua")
dofile(modpath .. "/items/items/blocks.lua")
dofile(modpath .. "/libs/signs_library.lua")


-- Register commands
-- Scan for files that end in '_tools.lua', '_mob.lua', '_ore.lua', '_node.lua', etc
-- Get each item's information and register each item
-- This is disabled until I write the code.
-- if item_type = "node", register node
-- if item_type = "tool", registe tool
-- if item_type = "mob", registe mob

-- Until I get the scanning code working,
-- Use the dofile command to load each item:
-- This will be a long list

-- load items
-- bucket before cityblock_library
dofile(modpath .. "/items/items/player.lua")
dofile(modpath .. "/items/items/brick_node.lua")
dofile(modpath .. "/items/items/rebar_craftitem.lua")
dofile(modpath .. "/items/items/truss_node.lua")
dofile(modpath .. "/items/items/concrete_node.lua")
dofile(modpath .. "/items/items/bucket_node.lua")
dofile(modpath .. "/libs/cityblock_library.lua")
dofile(modpath .. "/libs/furnaces_library.lua")
dofile(modpath .. "/libs/chests_library.lua")
dofile(modpath .. "/libs/bookshelf_library.lua")
dofile(modpath .. "/libs/books_library.lua")

dofile(modpath .. "/items/items/aspen_wood_node.lua")
dofile(modpath .. "/items/items/acacia_wood_node.lua")
dofile(modpath .. "/items/items/junglewood_node.lua")
dofile(modpath .. "/items/items/pine_wood_node.lua")
dofile(modpath .. "/items/items/wood_node.lua")
-- screwdriver before signs_node
dofile(modpath .. "/items/items/screwdriver.lua")
dofile(modpath .. "/items/items/clay_node.lua")
dofile(modpath .. "/items/items/stone_with_coal_node.lua")
dofile(modpath .. "/items/items/coalblock_node.lua")
dofile(modpath .. "/items/items/stone_with_iron_node.lua")
dofile(modpath .. "/items/items/stone_with_copper_node.lua")
dofile(modpath .. "/items/items/stone_with_mese_node.lua")
dofile(modpath .. "/items/items/stone_with_gold_node.lua")
dofile(modpath .. "/items/items/stone_with_diamond_node.lua")
dofile(modpath .. "/items/items/coal_lump_craftitem.lua")
dofile(modpath .. "/items/items/iron_lump_craftitem.lua")
dofile(modpath .. "/items/items/copper_lump_craftitem.lua")
dofile(modpath .. "/items/items/gold_lump_craftitem.lua")
dofile(modpath .. "/items/items/diamond_craftitem.lua")
dofile(modpath .. "/items/items/steel_ingot_craftitem.lua")
dofile(modpath .. "/items/items/copper_ingot_craftitem.lua")
dofile(modpath .. "/items/items/bronze_ingot_craftitem.lua")
dofile(modpath .. "/items/items/gold_ingot_craftitem.lua")
dofile(modpath .. "/items/items/mese_crystal_fragment_craftitem.lua")
dofile(modpath .. "/items/items/mese_crystal_craftitem.lua")
dofile(modpath .. "/items/items/clay_lump_craftitem.lua")
dofile(modpath .. "/items/items/clay_brick_craftitem.lua")
dofile(modpath .. "/items/items/obsidian_shard_craftitem.lua")
dofile(modpath .. "/items/items/sand_node.lua")
dofile(modpath .. "/items/items/desert_sand_node.lua")
dofile(modpath .. "/items/items/silver_sand_node.lua")
dofile(modpath .. "/items/items/gravel_node.lua")
dofile(modpath .. "/items/items/glass_node.lua")
dofile(modpath .. "/items/items/obsidian_glass_node.lua")
dofile(modpath .. "/items/items/meselamp_node.lua")
dofile(modpath .. "/items/items/dirt_node.lua")
dofile(modpath .. "/items/items/dirt_with_grass_node.lua")
dofile(modpath .. "/items/items/dirt_with_grass_footsteps_node.lua")
dofile(modpath .. "/items/items/dirt_with_snow_node.lua")
dofile(modpath .. "/items/items/snow_node.lua")
dofile(modpath .. "/items/items/ice_node.lua")
dofile(modpath .. "/items/items/water_source_node.lua")
dofile(modpath .. "/items/items/water_flowing_node.lua")
dofile(modpath .. "/items/items/lava_source_node.lua")
dofile(modpath .. "/items/items/lava_flowing_node.lua")
dofile(modpath .. "/items/items/cloud_node.lua")
dofile(modpath .. "/items/items/torch_node.lua")
dofile(modpath .. "/items/items/torch_wall_node.lua")
dofile(modpath .. "/items/items/torch_ceiling_node.lua")
dofile(modpath .. "/items/items/flint_craftitem.lua")
dofile(modpath .. "/items/items/stick_craftitem.lua")
dofile(modpath .. "/items/items/paper_craftitem.lua")
dofile(modpath .. "/items/items/furnace_node.lua")
dofile(modpath .. "/items/items/furnace_active_node.lua")
dofile(modpath .. "/items/items/chest_node.lua")
dofile(modpath .. "/items/items/chest_locked_node.lua")
dofile(modpath .. "/items/items/bookshelf_node.lua")
dofile(modpath .. "/items/items/book_craftitem.lua")
dofile(modpath .. "/items/items/book_written_craftitem.lua")
dofile(modpath .. "/items/items/ladder_wood_node.lua")
dofile(modpath .. "/items/items/ladder_steel_node.lua")

dofile(modpath .. "/items/items/boat_node.lua")
dofile(modpath .. "/items/items/bones_node.lua")
dofile(modpath .. "/items/items/dyes_node.lua")
dofile(modpath .. "/items/items/wool_node.lua")
dofile(modpath .. "/items/items/walls_node.lua")
dofile(modpath .. "/items/items/doors_node.lua")
dofile(modpath .. "/items/items/nyancat_node.lua")
dofile(modpath .. "/items/items/nyancat_rainbow_node.lua")
dofile(modpath .. "/items/items/beds_node.lua")
dofile(modpath .. "/items/items/farming.lua")
dofile(modpath .. "/items/items/growing_things.lua")
dofile(modpath .. "/items/items/xpanes_node.lua")
dofile(modpath .. "/items/items/vessels_shelf_node.lua")
dofile(modpath .. "/items/items/glass_bottle_node.lua")
dofile(modpath .. "/items/items/steel_bottle_node.lua")
dofile(modpath .. "/items/items/glass_fragments_craftitem.lua")
dofile(modpath .. "/items/items/drinking_glass_node.lua")
dofile(modpath .. "/items/items/city_block_node.lua")
dofile(modpath .. "/items/items/cart_item.lua")
--dofile(modpath .. "/items/items/constructor_node.lua")
dofile(modpath .. "/items/items/protect_node.lua")
dofile(modpath .. "/items/items/protect2_node.lua")
dofile(modpath .. "/items/items/protected_chest_node.lua")
dofile(modpath .. "/items/items/protected_door_steel_node.lua")
dofile(modpath .. "/items/items/protected_door_wood_node.lua")
dofile(modpath .. "/items/items/protected_trapdoor_wood_node.lua")
dofile(modpath .. "/items/items/protected_trapdoor_steel_node.lua")
dofile(modpath .. "/items/items/protection_tool.lua")
dofile(modpath .. "/items/items/protector_items.lua")
dofile(modpath .. "/items/items/vessels_node.lua")
dofile(modpath .. "/items/items/stone_node.lua")
dofile(modpath .. "/items/items/cobble_node.lua")
dofile(modpath .. "/items/items/stonebrick_node.lua")
dofile(modpath .. "/items/items/stone_block_node.lua")
dofile(modpath .. "/items/items/mossycobble_node.lua")
dofile(modpath .. "/items/items/desert_stone_node.lua")
dofile(modpath .. "/items/items/desert_stonebrick_node.lua")
dofile(modpath .. "/items/items/desert_stone_block_node.lua")
dofile(modpath .. "/items/items/desert_cobble_node.lua")
dofile(modpath .. "/items/items/sandstone_node.lua")
dofile(modpath .. "/items/items/sandstonebrick_node.lua")
dofile(modpath .. "/items/items/sandstone_block_node.lua")
dofile(modpath .. "/items/items/obsidian_node.lua")
dofile(modpath .. "/items/items/obsidianbrick_node.lua")
dofile(modpath .. "/items/items/obsidian_block_node.lua")
dofile(modpath .. "/items/items/snowblock_node.lua")
dofile(modpath .. "/items/items/steelblock_node.lua")
dofile(modpath .. "/items/items/copperblock_node.lua")
dofile(modpath .. "/items/items/bronzeblock_node.lua")
dofile(modpath .. "/items/items/mese_node.lua")
dofile(modpath .. "/items/items/goldblock_node.lua")
dofile(modpath .. "/items/items/diamond_block_node.lua")
dofile(modpath .. "/items/items/stairs_and_slabs.lua")
dofile(modpath .. "/items/items/fences_node.lua")
dofile(modpath .. "/items/items/tools.lua")
dofile(modpath .. "/items/items/signs_node.lua")
dofile(modpath .. "/items/items/coral_brown_node.lua")
dofile(modpath .. "/items/items/coral_orange_node.lua")
dofile(modpath .. "/items/items/coral_skeleton_node.lua")
dofile(modpath .. "/items/items/bakedclay_node.lua")

-- Load entities
dofile(modpath .. "/items/mobs/cart_entity.lua")
dofile(modpath .. "/items/mobs/smoke_entity.lua")

-- load misc
dofile(modpath .. "/items/misc/afkkick.lua")
dofile(modpath .. "/items/misc/falling.lua")
--dofile(modpath .. "/items/misc/sfinv_init.lua")
dofile(modpath .. "/items/misc/chat_anticurse.lua")
dofile(modpath .. "/items/misc/names_per_IP.lua")
dofile(modpath .. "/items/misc/locked_sign.lua")

-- load commands
dofile(modpath .. "/items/commands/info.lua")
dofile(modpath .. "/items/commands/give_initial_stuff.lua")
dofile(modpath .. "/items/commands/spawn.lua")
-- chat_anticurse before chat2
dofile(modpath .. "/items/commands/chat2.lua")
dofile(modpath .. "/items/commands/sethome.lua")
dofile(modpath .. "/items/commands/reserved_slots_enhanced.lua")
dofile(modpath .. "/items/commands/money2.lua")

-- load aliases for existing worlds
dofile(modpath .. "/aliases.lua")
dofile(modpath .. "/items/misc/ABMs.lua")
-- mapgen before flowers
dofile(modpath .. "/mapgen.lua")
dofile(modpath .. "/items/items/flowers_node.lua")


-- It would be nice if I had a summary showing what items are registered
-- with this mod. Including info about item type, recipes, and fuel

minetest.log("action", S("Mod custom is now loaded."))

print(string.format("World items loaded after ca. %.2fs", os.clock() - load_time_start))

--print("Deleting area")
--minetest.delete_area({x=-100, y=100, z=-100}, {x=100, y=-100, z=100})
