minetest.register_node("cwalias:truss", {
	description = "Steel Truss",
  drawtype = "allfaces",
	tiles = {"truss.png",},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("cwalias:gravel", {
	description = "Gravel",
	tiles = {"cwgravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
})

minetest.override_item("default:gravel", {
	tiles =  {"cwgravel.png"},
})

dofile(minetest.get_modpath("cwalias").."/default.lua")
dofile(minetest.get_modpath("cwalias").."/protector.lua")
dofile(minetest.get_modpath("cwalias").."/nyancat.lua")
dofile(minetest.get_modpath("cwalias").."/carts.lua")
dofile(minetest.get_modpath("cwalias").."/flowers.lua")
dofile(minetest.get_modpath("cwalias").."/stairs.lua")
dofile(minetest.get_modpath("cwalias").."/signs.lua")
dofile(minetest.get_modpath("cwalias").."/farming.lua")
dofile(minetest.get_modpath("cwalias").."/xpanes.lua")
dofile(minetest.get_modpath("cwalias").."/beds.lua")
dofile(minetest.get_modpath("cwalias").."/wool.lua")
dofile(minetest.get_modpath("cwalias").."/vessels.lua")
dofile(minetest.get_modpath("cwalias").."/bakedclay.lua")
dofile(minetest.get_modpath("cwalias").."/walls.lua")
dofile(minetest.get_modpath("cwalias").."/doors.lua")
--dofile(minetest.get_modpath("cwalias").."/.lua")
--dofile(minetest.get_modpath("cwalias").."/.lua")
--dofile(minetest.get_modpath("cwalias").."/.lua")
--dofile(minetest.get_modpath("cwalias").."/.lua")
--dofile(minetest.get_modpath("cwalias").."/.lua")

--minetest.register_alias("custom:",":")
--minetest.register_alias("custom:",":")
--minetest.register_alias("custom:",":")
--minetest.register_alias("custom:",":")
--minetest.register_alias("custom:",":")
--minetest.register_alias("custom:",":")
--minetest.register_alias("custom:",":")
--minetest.register_alias("custom:",":")
--minetest.register_alias("custom:",":")

minetest.register_alias("custom:cityblock","city_block:cityblock")
minetest.register_alias("custom:bones","bones:bones")

minetest.register_alias("custom:stair_concrete","stairs:stair_bakedclay_grey")
minetest.register_alias("custom:slab_concrete","stairs:slab_bakedclay_grey")
minetest.register_alias("custom:concrete","bakedclay:grey")

minetest.register_alias("custom:door_hidden_segment","air")
--minetest.register_alias("custom:door_glass_a","doors:door_glass_a")
--minetest.register_alias("custom:door_glass_b","doors:door_glass_b")
--minetest.register_alias("custom:door_steel_a","doors:door_steel_a")
--minetest.register_alias("custom:door_wood_a","doors:door_wood_a")
--minetest.register_alias("custom:door_steel_b","doors:door_steel_b")
--minetest.register_alias("custom:door_wood_b","doors:door_wood_b")
