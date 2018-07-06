

minetest.register_craftitem("custom:cart", {
	description = "Cart (Sneak+Click to pick up)",
	inventory_image = minetest.inventorycube("custom_cart_top.png", "custom_cart_side.png", "custom_cart_side.png"),
	wield_image = "custom_cart_side.png",
	on_place = function(itemstack, placer, pointed_thing)
		if not pointed_thing.type == "node" then
			return
		end
		if carts:is_rail(pointed_thing.under) then
			minetest.add_entity(pointed_thing.under, "custom:cart")
		elseif carts:is_rail(pointed_thing.above) then
			minetest.add_entity(pointed_thing.above, "custom:cart")
		else
			return
		end

		minetest.sound_play({name = "custom_place_node_metal", gain = 0.5},
			{pos = pointed_thing.above})

		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})

minetest.register_craft({
	output = "custom:cart",
	recipe = {
		{"custom:steel_ingot", "", "custom:steel_ingot"},
		{"custom:steel_ingot", "custom:steel_ingot", "custom:steel_ingot"},
	},
})
