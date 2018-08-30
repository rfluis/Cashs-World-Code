
local Info = {
    Name = "nyancat",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Nyan Cat",
	tiles = {"custom_nyancat_side.png", "custom_nyancat_side.png", "custom_nyancat_side.png",
		"custom_nyancat_side.png", "custom_nyancat_back.png", "custom_nyancat_front.png"},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	legacy_facedir_simple = true,
	sounds = default.node_sound_defaults(),
}

local Recipes = {
    Number_Recipes = 0,

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
