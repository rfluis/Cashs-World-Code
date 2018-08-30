--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_stone", "custom:stone")
minetest.register_alias("mapgen_dirt", "custom:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "custom:dirt_with_grass")
minetest.register_alias("mapgen_sand", "custom:sand")
minetest.register_alias("mapgen_water_source", "custom:water_source")
minetest.register_alias("mapgen_river_water_source", "custom:air")
minetest.register_alias("mapgen_lava_source", "custom:lava_source")
minetest.register_alias("mapgen_gravel", "custom:gravel")
minetest.register_alias("mapgen_desert_stone", "custom:desert_stone")
minetest.register_alias("mapgen_desert_sand", "custom:desert_sand")
minetest.register_alias("mapgen_dirt_with_snow", "custom:dirt_with_snow")
minetest.register_alias("mapgen_snowblock", "custom:snowblock")
minetest.register_alias("mapgen_snow", "custom:snow")
minetest.register_alias("mapgen_ice", "custom:ice")
minetest.register_alias("mapgen_sandstone", "custom:sandstone")

-- Flora

minetest.register_alias("mapgen_tree", "custom:tree")
minetest.register_alias("mapgen_leaves", "custom:leaves")
minetest.register_alias("mapgen_apple", "custom:apple")
minetest.register_alias("mapgen_jungletree", "custom:jungletree")
minetest.register_alias("mapgen_jungleleaves", "custom:jungleleaves")
minetest.register_alias("mapgen_junglegrass", "custom:junglegrass")
minetest.register_alias("mapgen_pine_tree", "custom:pine_tree")
minetest.register_alias("mapgen_pine_needles", "custom:pine_needles")

-- Dungeons

minetest.register_alias("mapgen_cobble", "custom:cobble")
minetest.register_alias("mapgen_stair_cobble", "custom:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "custom:mossycobble")
minetest.register_alias("mapgen_sandstonebrick", "custom:sandstonebrick")
minetest.register_alias("mapgen_stair_sandstonebrick", "custom:stair_sandstonebrick")


--
-- Register ores
--

function default.register_ores()
	minetest.clear_registered_ores()

--Maikerumine added for nicer looking deserts
--DEFAULT STRATA
minetest.register_ore({
   name = "Stone Sheet",
   ore_type       = "sheet",
   ore            = "custom:stone",
   wherein        = {"custom:desert_stone","custom:desert_sand"},
   clust_scarcity = 1,
   clust_num_ores = 3,
   clust_size     = 4,
   y_min     = 141,
   y_max     = 31000,
   noise_threshold = 0.4,
   noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
   name = "Clay Sheet",
   ore_type       = "sheet",
   ore            = "custom:clay",
   wherein        = {"custom:desert_stone","custom:desert_sand","custom:stone"},
   clust_scarcity = 1,
   clust_num_ores = 12,
   clust_size     = 8,
   y_min     = 141,
   y_max     = 31000,
   noise_threshold = 0.4,
   noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
   name = "Sandstone Sheet",
   ore_type       = "sheet",
   ore            = "custom:sandstone",
   wherein        ={"custom:desert_stone","custom:desert_sand","custom:stone"},
   clust_scarcity = 1,
   clust_num_ores = 12,
   clust_size     = 10,
   y_min     = 141,
   y_max     = 31000,
   noise_threshold = 0.2,
   noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
   name = "Dirt Sheet",
   ore_type       = "sheet",
   ore            = "custom:dirt",
   wherein        = {"custom:desert_stone","custom:desert_sand"},
   clust_scarcity = 1,
   clust_num_ores = 12,
   clust_size     = 4,
   y_min     = 141,
   y_max     = 31000,
   noise_threshold = 0.4,
   noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
   name = "Gravel Sheet",
   ore_type       = "sheet",
   ore            = "custom:gravel",
   wherein        = {"custom:desert_stone"},
   clust_scarcity = 1,
   clust_num_ores = 8,
   clust_size     = 4,
   y_min     = 141,
   y_max     = 31000,
   noise_threshold = 0.4,
   noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
   name = "Coalblock Sheet",
   ore_type       = "sheet",
   ore            = "custom:coalblock",
   wherein        = {"custom:desert_stone","custom:stone"},
   clust_scarcity = 1,
   clust_num_ores = 12,
   clust_size     = 4,
   y_min     = 141,
   y_max     = 31000,
   noise_threshold = 0.4,
   noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.80}
})

minetest.register_ore({
   name = "Desert Sand Sheet",
   ore_type       = "sheet",
   ore            = "custom:desert_sand",
   wherein        = {"custom:desert_stone"},
   clust_scarcity = 1,
   clust_num_ores = 8,
   clust_size     = 4,
   y_min     = 141,
   y_max     = 31000,
   noise_threshold = 0.4,
   noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})


	-- Blob ores
	-- These first to avoid other ores in blobs

	-- Clay
	-- This first to avoid clay in sand blobs

	minetest.register_ore({
		name = "Clay Blob",
		ore_type        = "blob",
		ore             = "custom:clay",
		wherein         = {"custom:sand"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -15,
		y_max           = 0,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Sand

	minetest.register_ore({
		name = "Sand Blob",
		ore_type        = "blob",
		ore             = "custom:sand",
		wherein         = {"custom:stone", "custom:sandstone",
			"custom:desert_stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31,
		y_max           = 0,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Dirt

	minetest.register_ore({
		name = "Dirt Blob",
		ore_type        = "blob",
		ore             = "custom:dirt",
		wherein         = {"custom:stone","custom:sandstone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Gravel

	minetest.register_ore({
		name = "Gravel Blob",
		ore_type        = "blob",
		ore             = "custom:gravel",
		wherein         = {"custom:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31000,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Scatter ores

	-- Coal

   minetest.register_ore({
      name = "Coal1",
      ore_type       = "scatter",
      ore            = "custom:stone_with_coal",
      wherein        = "custom:stone",
      clust_scarcity = 8 * 8 * 8,
      clust_num_ores = 8,
      clust_size     = 3,
      y_min          = -31000,
      y_max          = 64,
   })

   minetest.register_ore({
      name = "Coal2",
      ore_type       = "scatter",
      ore            = "custom:stone_with_coal",
      wherein        = "custom:stone",
      clust_scarcity = 24 * 24 * 24,
      clust_num_ores = 27,
      clust_size     = 6,
      y_min          = -31000,
      y_max          = 0,
   })

	-- Iron

   minetest.register_ore({
      name = "Iron Ore1",
      ore_type       = "scatter",
      ore            = "custom:stone_with_iron",
      wherein        = "custom:stone",
      clust_scarcity = 12 * 12 * 12,
      clust_num_ores = 3,
      clust_size     = 2,
      y_min          = -15,
      y_max          = 2,
   })

   minetest.register_ore({
      name = "Iron Ore2",
      ore_type       = "scatter",
      ore            = "custom:stone_with_iron",
      wherein        = "custom:stone",
      clust_scarcity = 9 * 9 * 9,
      clust_num_ores = 5,
      clust_size     = 3,
      y_min          = -63,
      y_max          = -16,
   })

   minetest.register_ore({
      name = "Iron Ore3",
      ore_type       = "scatter",
      ore            = "custom:stone_with_iron",
      wherein        = "custom:stone",
      clust_scarcity = 7 * 7 * 7,
      clust_num_ores = 5,
      clust_size     = 3,
      y_min          = -31000,
      y_max          = -64,
   })

   minetest.register_ore({
      name = "Iron Ore4",
      ore_type       = "scatter",
      ore            = "custom:stone_with_iron",
      wherein        = "custom:stone",
      clust_scarcity = 24 * 24 * 24,
      clust_num_ores = 27,
      clust_size     = 6,
      y_min          = -31000,
      y_max          = -64,
   })

   --Mese

   minetest.register_ore({
      name = "Mese1",
      ore_type       = "scatter",
      ore            = "custom:stone_with_mese",
      wherein        = "custom:stone",
      clust_scarcity = 18 * 18 * 18,
      clust_num_ores = 3,
      clust_size     = 2,
      y_min          = -255,
      y_max          = -64,
   })

   minetest.register_ore({
      name = "Mese2",
      ore_type       = "scatter",
      ore            = "custom:stone_with_mese",
      wherein        = "custom:stone",
      clust_scarcity = 14 * 14 * 14,
      clust_num_ores = 5,
      clust_size     = 3,
      y_min          = -31000,
      y_max          = -256,
   })

   minetest.register_ore({
      name = "Mese3",
      ore_type       = "scatter",
      ore            = "custom:mese",
      wherein        = "custom:stone",
      clust_scarcity = 36 * 36 * 36,
      clust_num_ores = 3,
      clust_size     = 2,
      y_min          = -31000,
      y_max          = -1024,
   })

   -- Gold

   minetest.register_ore({
      name = "Gold Ore1",
      ore_type       = "scatter",
      ore            = "custom:stone_with_gold",
      wherein        = "custom:stone",
      clust_scarcity = 15 * 15 * 15,
      clust_num_ores = 3,
      clust_size     = 2,
      y_min          = -255,
      y_max          = -64,
   })

   minetest.register_ore({
      name = "Gold Ore2",
      ore_type       = "scatter",
      ore            = "custom:stone_with_gold",
      wherein        = "custom:stone",
      clust_scarcity = 13 * 13 * 13,
      clust_num_ores = 5,
      clust_size     = 3,
      y_min          = -31000,
      y_max          = -256,
   })

   -- Diamond

   minetest.register_ore({
      name = "Diamond1",
      ore_type       = "scatter",
      ore            = "custom:stone_with_diamond",
      wherein        = "custom:stone",
      clust_scarcity = 17 * 17 * 17,
      clust_num_ores = 4,
      clust_size     = 3,
      y_min          = -255,
      y_max          = -128,
   })

   minetest.register_ore({
      name = "Diamond2",
      ore_type       = "scatter",
      ore            = "custom:stone_with_diamond",
      wherein        = "custom:stone",
      clust_scarcity = 15 * 15 * 15,
      clust_num_ores = 4,
      clust_size     = 3,
      y_min          = -31000,
      y_max          = -256,
   })


   -- Copper

   minetest.register_ore({
      name = "Copper Ore1",
      ore_type       = "scatter",
      ore            = "custom:stone_with_copper",
      wherein        = "custom:stone",
      clust_scarcity = 12 * 12 * 12,
      clust_num_ores = 4,
      clust_size     = 3,
      y_min          = -63,
      y_max          = -16,
   })

   minetest.register_ore({
      name = "Copper Ore2",
      ore_type       = "scatter",
      ore            = "custom:stone_with_copper",
      wherein        = "custom:stone",
      clust_scarcity = 9 * 9 * 9,
      clust_num_ores = 5,
      clust_size     = 3,
      y_min          = -31000,
      y_max          = -64,
   })

end


--
-- Register biomes
--

-- All mapgens except mgv6 and singlenode

function default.register_biomes()
	minetest.clear_registered_biomes()

    minetest.register_biome({
    name = "glacier",
    node_dust = "custom:snowblock",
    node_top = "custom:snowblock",
    depth_top = "1",
    node_filler = "custom:ice",
    depth_filler = "5",
    --node_stone = "custom:ice",
    node_water_top = "custom:ice",
    depth_water_top = 10,
    node_river_water = "custom:ice",
    y_min = -28,
    y_max = 31000,
    heat_point = 0,
    humidity_point = 50,
    })

    minetest.register_biome({
    name = "glacier_ocean",
    node_dust = "custom:snowblock",
    node_top = "custom:sand",
    depth_top = "1",
    node_filler = "custom:sand",
    depth_filler = "3",
    y_min = -112,
    y_max = -29,
    heat_point = 0,
    humidity_point = 50,
    })

    minetest.register_biome({
    name = "tundra_mountaintop",
    node_dust = "custom:snowblock",
    node_top = "custom:snowblock",
    depth_top = "1",
    node_filler = "custom:ice",
    depth_filler = "3",
    --node_stone = "custom:ice",
    node_water_top = "custom:ice",
    depth_water_top = 10,
    node_river_water = "custom:ice",
    y_min = 401,
    y_max = 31000,
    heat_point = 15,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "tundra_mountain",
    node_dust = "custom:snow",
    node_top = "custom:snowblock",
    depth_top = "1",
    node_filler = "custom:snowblock",
    depth_filler = "3",
    --node_stone = "",
    y_min = 201,
    y_max = 400,
    heat_point = 15,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "tundra_highlands",
    node_dust = "custom:snow",
    node_top = "custom:dirt_with_snow",
    depth_top = "1",
    node_filler = "custom:dirt",
    depth_filler = "2",
    --node_stone = "",
    y_min = 141,
    y_max = 200,
    heat_point = 15,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "tundra_lowlands",
    node_dust = "custom:dirt_with_snow",
    node_top = "custom:dirt",
    depth_top = "3",
    node_filler = "custom:gravel",
    depth_filler = "3",
    --node_stone = "",
    y_min = -19,
    y_max = 140,
    heat_point = 15,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "taiga_mountaintop",
    node_dust = "custom:snow",
    node_top = "custom:snowblock",
    depth_top = "1",
    node_filler = "custom:snowblock",
    depth_filler = "3",
    --node_stone = "",
    y_min = 401,
    y_max = 31000,
    heat_point = 15,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "taiga_mountain",
    node_dust = "custom:snow",
    node_top = "custom:snowblock",
    depth_top = "1",
    node_filler = "custom:snowblock",
    depth_filler = "3",
    --node_stone = "",
    y_min = 201,
    y_max = 400,
    heat_point = 15,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "taiga_highlands",
    node_dust = "custom:snow",
    node_top = "custom:dirt_with_snow",
    depth_top = "1",
    node_filler = "custom:dirt",
    depth_filler = "3",
    --node_stone = "",
    y_min = 141,
    y_max = 200,
    heat_point = 15,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "taiga_lowlands",
    --node_dust = "",
    node_top = "custom:dirt_with_grass",
    depth_top = "1",
    node_filler = "custom:dirt",
    depth_filler = "3",
    --node_stone = "",
    y_min = -17,
    y_max = 140,
    heat_point = 15,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "taiga_ocean",
    --node_dust = "",
    node_top = "custom:sand",
    depth_top = "1",
    node_filler = "custom:sand",
    depth_filler = "3",
    --node_stone = "",
    y_min = -112,
    y_max = -18,
    heat_point = 15,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "wasteland_lowlands",
    --node_dust = "",
    node_top = "custom:sand",
    depth_top = "3",
    node_filler = "custom:sandstone",
    depth_filler = "3",
    --node_stone = "",
    y_min = -14,
    y_max = 140,
    heat_point = 40,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "wasteland_flatlands",
    --node_dust = "",
    node_top = "custom:sand",
    depth_top = "3",
    node_filler = "custom:sandstone",
    depth_filler = "3",
    --node_stone = "",
    y_min = -19,
    y_max = -15,
    heat_point = 40,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "wasteland_ocean",
    --node_dust = "",
    node_top = "custom:sand",
    depth_top = "3",
    node_filler = "custom:sandstone",
    depth_filler = "3",
    --node_stone = "",
    y_min = -112,
    y_max = -20,
    heat_point = 40,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "wasteland2_lowlands",
    --node_dust = "",
    node_top = "custom:sand",
    depth_top = "3",
    node_filler = "custom:sandstone",
    depth_filler = "3",
    --node_stone = "",
    y_min = -19,
    y_max = 140,
    heat_point = 40,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "wasteland2_ocean",
    --node_dust = "",
    node_top = "custom:sand",
    depth_top = "3",
    node_filler = "custom:sandstone",
    depth_filler = "3",
    --node_stone = "",
    y_min = -112,
    y_max = -20,
    heat_point = 40,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "desert2_mountain",
    node_dust = "custom:snow",
    node_top = "custom:snowblock",
    depth_top = "2",
    node_filler = "custom:desert_stone",
    depth_filler = "3",
    --node_stone = "",
    y_min = 401,
    y_max = 31000,
    heat_point = 60,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "desert2_highlands",
    node_dust = "custom:snow",
    node_top = "custom:desert_stone",
    depth_top = "3",
    node_filler = "custom:desert_stone",
    depth_filler = "3",
    --node_stone = "",
    y_min = 141,
    y_max = 400,
    heat_point = 60,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "desert2_lowlands",
    --node_dust = "custom:desert_sand",
    node_top = "custom:desert_sand",
    depth_top = "3",
    node_filler = "custom:desert_stone",
    depth_filler = "4",
    --node_stone = "",
    y_min = -13,
    y_max = 140,
    heat_point = 60,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "desert2_dunes",
    --node_dust = "",
    node_top = "custom:desert_sand",
    depth_top = "3",
    node_filler = "custom:desert_sand",
    depth_filler = "3",
    node_stone = "custom:desert_stone",
    y_min = -19,
    y_max = -14,
    heat_point = 60,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "desert2_ocean",
    --node_dust = "",
    node_top = "custom:desert_sand",
    depth_top = "2",
    node_filler = "custom:desert_stone",
    depth_filler = "3",
    --node_stone = "",
    y_min = -112,
    y_max = -20,
    heat_point = 60,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "deciduous_forest_mountaintop",
    node_dust = "custom:snow",
    node_top = "custom:stone",
    depth_top = "1",
    node_filler = "custom:stone",
    depth_filler = "1",
    --node_stone = "",
    y_min = 401,
    y_max = 31000,
    heat_point = 60,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "deciduous_forest",
    --node_dust = "",
    node_top = "custom:dirt_with_grass",
    depth_top = "1",
    node_filler = "custom:dirt",
    depth_filler = "3",
    --node_stone = "",
    y_min = -19,
    y_max = 400,
    heat_point = 60,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "deciduous_forest_swamp",
    --node_dust = "",
    node_top = "custom:dirt",
    depth_top = "1",
    node_filler = "custom:dirt",
    depth_filler = "3",
    --node_stone = "",
    y_min = -23,
    y_max = -20,
    heat_point = 60,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "deciduous_forest_ocean",
    --node_dust = "",
    node_top = "custom:sand",
    depth_top = "1",
    node_filler = "custom:sand",
    depth_filler = "1",
    --node_stone = "",
    y_min = -112,
    y_max = -24,
    heat_point = 60,
    humidity_point = 65,
    })

    minetest.register_biome({
    name = "desert_mountain",
    node_dust = "custom:snow",
    node_top = "custom:snowblock",
    depth_top = "2",
    node_filler = "custom:desert_stone",
    depth_filler = "3",
    --node_stone = "",
    y_min = 401,
    y_max = 31000,
    heat_point = 60,
    humidity_point = 35,
    })

    minetest.register_biome({
    name = "desert_highlands",
    node_dust = "custom:snow",
    node_top = "custom:desert_stone",
    depth_top = "3",
    node_filler = "custom:desert_stone",
    depth_filler = "3",
    --node_stone = "",
    y_min = 141,
    y_max = 400,
    heat_point = 85,
    humidity_point = 20,
    })

    minetest.register_biome({
    name = "desert_highflatlands",
    --node_dust = "",
    node_top = "custom:desert_sand",
    depth_top = "3",
    node_filler = "custom:desert_stone",
    depth_filler = "4",
    --node_stone = "",
    y_min = 136,
    y_max = 140,
    heat_point = 85,
    humidity_point = 20,
    })

    minetest.register_biome({
    name = "desert_lowlands",
    --node_dust = "",
    node_top = "custom:desert_sand",
    depth_top = "3",
    node_filler = "custom:desert_stone",
    depth_filler = "4",
    --node_stone = "",
    y_min = -19,
    y_max = 135,
    heat_point = 85,
    humidity_point = 20,
    })

    minetest.register_biome({
    name = "desert_ocean",
    --node_dust = "",
    node_top = "custom:desert_sand",
    depth_top = "2",
    node_filler = "custom:desert_stone",
    depth_filler = "3",
    --node_stone = "",
    y_min = -112,
    y_max = -20,
    heat_point = 85,
    humidity_point = 20,
    })

    minetest.register_biome({
    name = "savanna_flatlands",
    --node_dust = "",
    node_top = "custom:dirt_with_grass",
    depth_top = "1",
    node_filler = "custom:dirt",
    depth_filler = "2",
    --node_stone = "",
    y_min = -19,
    y_max = -15,
    heat_point = 85,
    humidity_point = 50,
    })

    minetest.register_biome({
    name = "savanna_swamp",
    --node_dust = "",
    node_top = "custom:dirt",
    depth_top = "3",
    node_filler = "custom:stone",
    depth_filler = "2",
    --node_stone = "",
    y_min = -23,
    y_max = -20,
    heat_point = 85,
    humidity_point = 50,
    })

    minetest.register_biome({
    name = "savanna_ocean",
    --node_dust = "",
    node_top = "custom:sand",
    depth_top = "2",
    node_filler = "custom:stone",
    depth_filler = "2",
    --node_stone = "",
    y_min = -112,
    y_max = -24,
    heat_point = 85,
    humidity_point = 50,
    })

    minetest.register_biome({
    name = "rainforest_lowlands",
    --node_dust = "",
    node_top = "custom:dirt_with_grass",
    depth_top = "1",
    node_filler = "custom:dirt",
    depth_filler = "3",
    --node_stone = "",
    y_min = -19,
    y_max = 140,
    heat_point = 85,
    humidity_point = 80,
    })

    minetest.register_biome({
    name = "rainforest_swamp",
    --node_dust = "",
    node_top = "custom:dirt",
    depth_top = "2",
    node_filler = "custom:dirt",
    depth_filler = "1",
    --node_stone = "",
    y_min = -23,
    y_max = -20,
    heat_point = 85,
    humidity_point = 80,
    })

    minetest.register_biome({
    name = "rainforest_ocean",
    --node_dust = "",
    node_top = "custom:dirt",
    depth_top = "1",
    node_filler = "custom:sand",
    depth_filler = "2",
    --node_stone = "",
    y_min = -112,
    y_max = -24,
    heat_point = 85,
    humidity_point = 80,
    })

    minetest.register_biome({
    name = "underground",
    --node_dust = "",
    --node_top = "",
    --depth_top = "",
    --node_filler = "",
    --depth_filler = "",
    --node_stone = "",
    y_min = -31000,
    y_max = -113,
    heat_point = 50,
    humidity_point = 50,
    })

end


--
-- Register decorations
--



function default.register_decorations()
	minetest.clear_registered_decorations()

	-- Apple tree and log
	minetest.register_decoration({
        name = "Apple Tree",
		deco_type = "schematic",
		place_on = {"custom:dirt_with_grass"},
		sidelen = 16,
--[[		noise_params = {
			offset = 0.04,
			scale = 0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
--]]
		fill_ratio = 0.02,
		biomes = {"deciduous_forest"},
		y_min = -19,
		y_max = 31000,
		schematic = minetest.get_modpath("custom").."/schematics/apple_tree.mts",
		flags = "place_center_x, place_center_z",
	})
--[[
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"custom:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.002,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"highlands"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = { x = 3, y = 3, z = 1},
			data = {
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
				{ name = "custom:tree", param2 = 12, prob = 191 },
				{ name = "custom:tree", param2 = 12 },
				{ name = "custom:tree", param2 = 12, prob = 127 },
				{ name = "air", prob = 0 },
--				{ name = "flowers:mushroom_brown", prob = 63 },
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})
--]]
	-- Jungle tree and log
	minetest.register_decoration({
		name = "Jungle Tree",
		deco_type = "schematic",
		place_on = {"custom:dirt_with_grass", "custom:dirt"},
		sidelen = 80,
--[[		noise_params = {
			offset = 0.04,
			scale = 0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
--]]
		fill_ratio = 0.02,
--		biomes = {"rainforest", "rainforest_swamp"},
		biomes = {"deciduous_forest_swamp", "rainforest_swamp"},
		y_min = -22,
		y_max = 31000,
		schematic = minetest.get_modpath("custom").."/schematics/jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
--[[
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"custom:dirt_with_grass", "custom:dirt"},
		sidelen = 80,
		fill_ratio = 0.01,
--		biomes = {"rainforest", "rainforest_swamp"},
		biomes = {"lowlands"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = { x = 3, y = 3, z = 1},
			data = {
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
				{ name = "custom:jungletree", param2 = 12, prob = 191 },
				{ name = "custom:jungletree", param2 = 12 },
				{ name = "custom:jungletree", param2 = 12, prob = 127 },
				{ name = "air", prob = 0 },
--				{ name = "flowers:mushroom_brown", prob = 127 },
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})
--]]
	-- Junglegrass
	minetest.register_decoration({
		name = "Junglegrass",
		deco_type = "simple",
		place_on = {"custom:dirt_with_grass"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"rainforest_lowlands"},
		y_min = -19,
		y_max = 25,
		decoration = "custom:junglegrass",
	})
	-- Papyrus
	minetest.register_decoration({
		name = "Papyrus",
		deco_type = "schematic",
		place_on = {"custom:dirt"},
		sidelen = 16,
--[[		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
--]]
		fill_ratio = 0.1,
		biomes = {"savanna_swamp"},
		y_min = -20,
		y_max = -20,
		schematic = minetest.get_modpath("custom").."/schematics/papyrus.mts",
	})
	-- Taiga and temperate coniferous forest pine tree and log
	minetest.register_decoration({
		name = "Pine Tree",
		deco_type = "schematic",
		place_on = {"custom:dirt_with_snow", "custom:dirt_with_grass"},
		sidelen = 16,
--[[		noise_params = {
			offset = 0.04,
			scale = 0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
--]]
		fill_ratio = 0.02,
--		biomes = {"taiga", "coniferous_forest"},
		biomes = {"tundra_highlands", "taiga_highlands", "taiga_lowlands"},
		y_min = -17,
		y_max = 31000,
		schematic = minetest.get_modpath("custom").."/schematics/pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})
--[[
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"custom:dirt_with_snow", "custom:dirt_with_grass"},
		sidelen = 80,
		fill_ratio = 0.003,
--		biomes = {"taiga", "coniferous_forest"},
		biomes = {"mountain"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = { x = 3, y = 3, z = 1},
			data = {
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
				{ name = "custom:pine_tree", param2 = 12, prob = 191 },
				{ name = "custom:pine_tree", param2 = 12 },
				{ name = "custom:pine_tree", param2 = 12, prob = 127 },
				{ name = "air", prob = 0 },
--				{ name = "flowers:mushroom_red", prob = 63 },
				{ name = "air", prob = 0 },
				{ name = "air", prob = 0 },
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})
--]]
   -- Large cactus
   minetest.register_decoration({
      name = "Large Cactus",
      deco_type = "schematic",
      place_on = {"custom:desert_sand"},
      sidelen = 16,
--[[      noise_params = {
         offset = -0.0003,
         scale = 0.0009,
         spread = {x = 200, y = 200, z = 200},
         seed = 230,
         octaves = 3,
         persist = 0.6
      },
--]]
      fill_ratio = 0.005,
      biomes = {"desert2_lowlands", "desert_highflatlands", "desert_lowlands"},
      y_min = -18,
      y_max = 100,
      schematic = minetest.get_modpath("custom").."/schematics/large_cactus.mts",
      flags = "place_center_x",
      rotation = "random",
   })
   -- Cactus
   minetest.register_decoration({
      name = "Cactus",
      deco_type = "simple",
      place_on = {"custom:desert_sand"},
      sidelen = 16,
--[[      noise_params = {
         offset = -0.0003,
         scale = 0.0009,
         spread = {x = 200, y = 200, z = 200},
         seed = 230,
         octaves = 3,
         persist = 0.6
      },
--]]
		fill_ratio = 0.005,
      biomes = {"desert2_lowlands", "desert_highflatlands", "desert_lowlands"},
      y_min = -18,
      y_max = 100,
      decoration = "custom:cactus",
      height = 2,
      height_max = 5,
   })
   -- Dry shrub
   minetest.register_decoration({
      name = "Dry Shrub",
      deco_type = "simple",
      place_on = {"custom:desert_sand", "custom:dirt_with_snow"},
      sidelen = 16,
--[[      noise_params = {
         offset = 0,
         scale = 0.02,
         spread = {x = 200, y = 200, z = 200},
         seed = 329,
         octaves = 3,
         persist = 0.6
      },
--]]
		fill_ratio = 0.01,
      biomes = {"desert2_lowlands", "desert_highflatlands", "desert_lowlands", "tundra_lowlands", "wasteland_lowlands", "wasteland_flatlands", "wasteland2_lowlands"},
      y_min = -19,
      y_max = 31000,
      decoration = "custom:dry_shrub",
   })

	-- Coral reef

	minetest.register_decoration({
		name = "Corals",
		deco_type = "schematic",
		place_on = {"custom:sand"},
		noise_params = {
			offset = -0.1,
			scale = 0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 7013,
			octaves = 3,
			persist = 1,
		},
		biomes = {
            "desert2_ocean",
			"desert_ocean",
			"savanna_ocean",
			"rainforest_ocean",
		},
		y_min = -8,
		y_max = -2,
		schematic = minetest.get_modpath("custom") .. "/schematics/corals.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end


--
-- Detect mapgen to select functions
--

local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name == "v6" then
	default.register_ores()
	default.register_mgv6_decorations()
else
	default.register_biomes()
	default.register_ores()
	default.register_decorations()
end
