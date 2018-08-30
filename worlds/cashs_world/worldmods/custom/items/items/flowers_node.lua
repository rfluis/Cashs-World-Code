-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.


-- Namespace for functions

flowers = {}


-- Map Generation

--
-- Mgv6
--

local function register_mgv6_flower(name)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"custom:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "custom:flower_"..name,
	})
end
--[[
local function register_mgv6_mushroom(name)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"custom:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.04,
			spread = {x = 100, y = 100, z = 100},
			seed = 7133,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "custom:flower_"..name,
		spawn_by = "custom:tree",
		num_spawn_by = 1,
	})
end

local function register_mgv6_waterlily()
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"custom:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.12,
			scale = 0.3,
			spread = {x = 100, y = 100, z = 100},
			seed = 33,
			octaves = 3,
			persist = 0.7
		},
		y_min = 0,
		y_max = 0,
		schematic = minetest.get_modpath("flowers").."/schematics/waterlily.mts",
		rotation = "random",
	})
end
--]]
function flowers.register_mgv6_decorations()
	register_mgv6_flower("rose")
	register_mgv6_flower("tulip")
	register_mgv6_flower("dandelion_yellow")
	register_mgv6_flower("geranium")
	register_mgv6_flower("viola")
	register_mgv6_flower("dandelion_white")

--	register_mgv6_mushroom("mushroom_brown")
--	register_mgv6_mushroom("mushroom_red")

--	register_mgv6_waterlily()
end


--
-- All other biome API mapgens
--

local function register_flower(seed, name)
	minetest.register_decoration({
		name = name,
		deco_type = "simple",
		place_on = {"custom:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.015,
			scale = 0.025,
			spread = {x = 200, y = 200, z = 200},
			seed = seed,
			octaves = 3,
			persist = 0.6
		},
--		biomes = {"stone_grassland", "sandstone_grassland",
--			"deciduous_forest", "coniferous_forest"},
		biomes = {"taiga_lowlands", "deciduous_forest",
			"savanna_flatlands"},
		y_min = -16,
		y_max = 31000,
		decoration = "custom:flower_"..name,
	})
end
--[[
local function register_mushroom(name)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"custom:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 200, y = 200, z = 200},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest", "coniferous_forest"},
		y_min = 1,
		y_max = 31000,
		decoration = "flowers:"..name,
	})
end

local function register_waterlily()
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"custom:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.12,
			scale = 0.3,
			spread = {x = 200, y = 200, z = 200},
			seed = 33,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"rainforest_swamp", "savanna_swamp", "deciduous_forest_swamp"},
		y_min = 0,
		y_max = 0,
		schematic = minetest.get_modpath("flowers").."/schematics/waterlily.mts",
		rotation = "random",
	})
end
--]]
function flowers.register_decorations()
	register_flower(436,     "rose")
	register_flower(19822,   "tulip")
	register_flower(1220999, "dandelion_yellow")
	register_flower(36662,   "geranium")
	register_flower(1133,    "viola")
	register_flower(73133,   "dandelion_white")

--	register_mushroom("mushroom_brown")
--	register_mushroom("mushroom_red")

--	register_waterlily()
end


--
-- Detect mapgen to select functions
--

local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name == "v6" then
	flowers.register_mgv6_decorations()
else
	flowers.register_decorations()
end


--
-- Flowers
--

-- Aliases for original flowers mod

minetest.register_alias("flowers:flower_rose", "custom:flower_rose")
minetest.register_alias("flowers:flower_tulip", "custom:flower_tulip")
minetest.register_alias("flowers:flower_dandelion_yellow", "custom:flower_dandelion_yellow")
minetest.register_alias("flowers:flower_geranium", "custom:flower_geranium")
minetest.register_alias("flowers:flower_viola", "custom:flower_viola")
minetest.register_alias("flowers:flower_dandelion_white", "custom:flower_dandelion_white")


-- Flower registration

local function add_simple_flower(name, desc, box, f_groups)
	-- Common flowers' groups
	f_groups.snappy = 3
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node("custom:flower_" .. name, {
		description = desc,
		drawtype = "plantlike",
		waving = 1,
		tiles = {"custom_flower_" .. name .. ".png"},
		inventory_image = "custom_flower_" .. name .. ".png",
		wield_image = "custom_flower_" .. name .. ".png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		groups = f_groups,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = box
		}
	})
end

flowers.datas = {
	{
		"rose",
		"Rose",
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16},
		{color_red = 1, flammable = 1}
	},
	{
		"tulip",
		"Orange Tulip",
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 3 / 16, 2 / 16},
		{color_orange = 1, flammable = 1}
	},
	{
		"dandelion_yellow",
		"Yellow Dandelion",
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 4 / 16, 2 / 16},
		{color_yellow = 1, flammable = 1}
	},
	{
		"geranium",
		"Blue Geranium",
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 2 / 16, 2 / 16},
		{color_blue = 1, flammable = 1}
	},
	{
		"viola",
		"Viola",
		{-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16},
		{color_violet = 1, flammable = 1}
	},
	{
		"dandelion_white",
		"White dandelion",
		{-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16},
		{color_white = 1, flammable = 1}
	},
}

for _,item in pairs(flowers.datas) do
	add_simple_flower(unpack(item))
end


-- Flower spread
-- Public function to enable override by mods

function flowers.flower_spread(pos, node)
	pos.y = pos.y - 1
	local under = minetest.get_node(pos)
	pos.y = pos.y + 1
	if under.name == "custom:desert_sand" then
		minetest.set_node(pos, {name = "custom:dry_shrub"})
		return
	elseif under.name ~= "custom:dirt_with_grass" and
			under.name ~= "custom:dirt_with_dry_grass" then
		return
	end

	local light = minetest.get_node_light(pos)
	if not light or light < 13 then
		return
	end

	local pos0 = vector.subtract(pos, 4)
	local pos1 = vector.add(pos, 4)
	if #minetest.find_nodes_in_area(pos0, pos1, "group:flora") > 3 then
		return
	end

	local seedling = minetest.find_nodes_in_area_under_air(pos0, pos1,
		{"custom:dirt_with_grass", "custom:dirt_with_dry_grass"})
	if #seedling > 0 then
		seedling = seedling[math.random(#seedling)]
		seedling.y = seedling.y + 1
		light = minetest.get_node_light(seedling)
		if not light or light < 13 then
			return
		end
		minetest.set_node(seedling, {name = node.name})
	end
end

minetest.register_abm({
	label = "Flower spread",
	nodenames = {"group:flora"},
	neighbors = {"custom:dirt_with_grass", "custom:dirt_with_dry_grass",
		"custom:desert_sand"},
	interval = 13,
	chance = 96,
	action = function(...)
		flowers.flower_spread(...)
	end,
})
