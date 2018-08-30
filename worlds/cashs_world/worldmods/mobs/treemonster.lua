
-- Tree Monster (or Tree Gollum) by PilzAdam

mobs:register_mob("mobs:tree_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 2,
	hp_min = 7,
	hp_max = 33,
	armor = 100,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "mobs_tree_monster.b3d",
	textures = {
		{"mobs_tree_monster.png"},
	},
	blood_texture = "custom_wood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_treemonster",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	drops = {
		{name = "custom:tree_sapling",
		chance = 3, min = 1, max = 2},
		{name = "custom:jungle_tree_sapling",
		chance = 3, min = 1, max = 2},
		{name = "custom:apple",
		chance = 2, min = 1, max=3},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 2,
	fall_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 24,
		walk_start = 25,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		punch_start = 48,
		punch_end = 62,
	},
})

mobs:register_spawn("mobs:tree_monster", {"custom:leaves", "custom:jungleleaves"}, 7, 0, 7000, 2, 31000)

mobs:register_egg("mobs:tree_monster", "Tree Monster", "custom_tree_top.png", 1)
