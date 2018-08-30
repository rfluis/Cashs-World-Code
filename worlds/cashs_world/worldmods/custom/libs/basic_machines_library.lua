-- library files must end in '_library.lua'

-- scan for files that have filename endings that relate to what the item is. Such as:
-- '_tool', '_mob', '_node', '_ore', etc.

-- Get each item's definitions from its respective file
-- Register each item

-- BASIC_MACHINES: lightweight automation mod for minetest
-- minetest 0.4.14
-- (c) 2015-2016 rnd

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.


basic_machines = {};

basic_machines.craft_recipes = {
["keypad"] = {item = "custom:keypad", description = "Turns on/off lights and activates machines or opens doors", craft = {"custom:wood","custom:stick"}, tex  = "keypad"},
["light"]={item = "custom:light_on", description = "Light in darkness", craft = {"custom:torch 4"}, tex  = "light"},
["mover"]={item = "custom:mover", description = "Can dig, harvest, plant, teleport or move items from/in inventories", craft = {"custom:mese_crystal 6","custom:stone 2", "custom:keypad"}, tex = "basic_machine_mover_side"},

["detector"] = {item = "custom:detector", description = "Detect and measure players, objects,blocks,light level", craft = {"custom:mese_crystal 4","custom:keypad"}, tex = "detector"},

["distributor"]= {item = "custom:distributor", description = "Organize your circuits better", craft = {"custom:steel_ingot","custom:mese_crystal", "custom:keypad"}, tex = "distributor"},

["clock_generator"]= {item = "custom:clockgen", description = "For making circuits that run non stop", craft = {"custom:diamondblock","custom:keypad"}, tex = "basic_machine_clock_generator"},

["recycler"]= {item = "custom:recycler", description = "Recycle old tools", craft = {"custom:mese_crystal 8","custom:diamondblock"}, tex = "recycler"},

["enviroment"] = {item = "custom:enviro", description = "Change gravity and more", craft = {"custom:generator 8","custom:clockgen"}, tex = "enviro"},

["ball_spawner"]={item = "custom:ball_spawner", description = "Spawn moving energy balls", craft = {"custom:power_cell","custom:keypad"}, tex = "custom_ball"},

["battery"]={item = "custom:battery", description = "Power for machines", craft = {"custom:steel_ingot 3","custom:mese","custom:diamond"}, tex = "basic_machine_battery"},

["generator"]={item = "custom:generator", description = "Generate power crystals", craft = {"custom:diamondblock 5","custom:battery"}, tex = "basic_machine_generator"},

["autocrafter"] = {item = "custom:autocrafter", description = "Automate crafting", craft = { "custom:steel_ingot 5", "custom:mese_crystal 2", "custom:diamondblock 2"}, tex = "pipeworks_autocrafter"},

["grinder"] = {item = "custom:grinder", description = "Makes dusts and grinds materials", craft = {"custom:diamond 13","custom:mese 4"}, tex = "grinder"},
}

basic_machines.craft_recipe_order = { -- order in which nodes appear
	"keypad","light","grinder","mover", "battery","generator","detector", "distributor", "clock_generator","recycler","autocrafter","ball_spawner", "enviroment"
}

-- MACHINE PRIVILEGE
minetest.register_privilege("machines", {
	description = "Player is expert basic_machine user: his machines work while not present on server, can spawn more than 2 balls at once",
})

-- machines fuel related recipes
-- CHARCOAL

minetest.register_craftitem("custom:charcoal", {
	description = "Wood charcoal",
	inventory_image = "custom_coal_lump.png",
})


minetest.register_craft({
	type = 'cooking',
	recipe = "custom:tree",
	cooktime = 30,
	output = "custom:charcoal",
})

minetest.register_craft({
	output = "custom:coal_lump",
	recipe = {
		{"custom:charcoal"},
		{"custom:charcoal"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "custom:charcoal",
	-- note: to make it you need to use 1 tree block for fuel + 1 tree block, thats 2, caloric value 2*30=60
	burntime = 40, -- coal lump has 40, tree block 30, coal block 370 (9*40=360!)
})

-- COMPATIBILITY
print("[basic machines] loaded")
