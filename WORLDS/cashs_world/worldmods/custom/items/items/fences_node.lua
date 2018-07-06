
fences.register_fence("fence_wood", {
	description = "Wooden Fence",
	texture = "custom_fence_wood.png",
	inventory_image = "custom_fence_overlay.png^custom_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "custom_fence_overlay.png^custom_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	material = "custom:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
    burntime = 7
})

fences.register_fence("fence_acacia_wood", {
	description = "Acacia Fence",
	texture = "custom_fence_acacia_wood.png",
	inventory_image = "custom_fence_overlay.png^custom_acacia_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "custom_fence_overlay.png^custom_acacia_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	material = "custom:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
    burntime = 8
})

fences.register_fence("fence_junglewood", {
	description = "Junglewood Fence",
	texture = "custom_fence_junglewood.png",
	inventory_image = "custom_fence_overlay.png^custom_junglewood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "custom_fence_overlay.png^custom_junglewood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	material = "custom:junglewood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
    burntime = 9
})

fences.register_fence("fence_pine_wood", {
	description = "Pine Fence",
	texture = "custom_fence_pine_wood.png",
	inventory_image = "custom_fence_overlay.png^custom_pine_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "custom_fence_overlay.png^custom_pine_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	material = "custom:pine_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
    burntime = 6
})

fences.register_fence("fence_aspen_wood", {
	description = "Aspen Fence",
	texture = "custom_fence_aspen_wood.png",
	inventory_image = "custom_fence_overlay.png^custom_aspen_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "custom_fence_overlay.png^custom_aspen_wood.png^custom_fence_overlay.png^[makealpha:255,126,126",
	material = "custom:aspen_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
    burntime = 5
})
