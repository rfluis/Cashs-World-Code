--
-- Lavacooling
--

default.cool_lava = function(pos, node)
	if node.name == "custom:lava_source" then
		minetest.set_node(pos, {name = "custom:obsidian"})
	else -- Lava flowing
		minetest.set_node(pos, {name = "custom:stone"})
	end
	minetest.sound_play("custom_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

minetest.register_abm({
	label = "Lava cooling",
	nodenames = {"custom:lava_source", "custom:lava_flowing"},
	neighbors = {"group:cools_lava", "group:water"},
	interval = 1,
	chance = 1,
	catch_up = false,
	action = function(...)
		default.cool_lava(...)
	end,
})


-- convert signs:text to custom:signs_text
minetest.register_lbm({
	name = "custom:convert_signs_text_to_custom_signs_text",
	nodenames = {"signs:text"},
	run_at_every_load = true,
	action = function(pos,node)
        minetest.set_node(pos, {name = "custom:signs_text"})
	end,
})

minetest.register_lbm({
	name = "custom:3dtorch",
	nodenames = {"custom:torch"},
	action = function(pos, node)
		if node.param2 == 0 then
			minetest.set_node(pos, {name = "custom:torch_ceiling",
				param2 = node.param2})
		elseif node.param2 == 1 then
			minetest.set_node(pos, {name = "custom:torch",
				param2 = node.param2})
		else
			minetest.set_node(pos, {name = "custom:torch_wall",
				param2 = node.param2})
		end
	end
})
