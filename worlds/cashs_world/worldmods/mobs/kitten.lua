
-- Kitten by Jordach / BFD

mobs:register_mob("mobs:kitten", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = false,
	reach = 3,
	damage = 8,
	hp_min = 999,
	hp_max = 1000,
	armor = 0,
	collisionbox = {-0.3, -0.3, -0.3, 0.3, 0.1, 0.3},
	visual = "mesh",
	visual_size = {x = 0.5, y = 0.5},
	mesh = "mobs_kitten.b3d",
	textures = {
		{"mobs_kitten_striped.png"},
		{"mobs_kitten_splotchy.png"},
		{"mobs_kitten_ginger.png"},
		{"mobs_kitten_sandy.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_kitten",
	},
	view_range = 16,
	walk_velocity = 0.6,
	run_velocity = 5,
--	runaway = true,
	jump = true,
--	drops = {
--		{name = "farming:string",
--		chance = 1, min = 1, max = 1},
--	},
	water_damage = 1,
	lava_damage = 5,
	fear_height = 3,
	animation = {
		speed_normal = 42,
		stand_start = 97,
		stand_end = 192,
		walk_start = 0,
		walk_end = 96,
	},
	view_range = 12,
})

mobs:register_spawn("mobs:kitten", {"custom:dirt_with_grass", "custom:desert_cobble", "custom:cobble"}, 20, 12, 22000, 2, 31000)

mobs:register_egg("mobs:kitten", "Kitten", "mobs_kitten_inv.png", 0)
