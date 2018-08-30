
local Info = {
    Name = "nyancat_rainbow",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "Nyan Cat Rainbow",
	tiles = {
		"custom_nyancat_rainbow.png^[transformR90",
		"custom_nyancat_rainbow.png^[transformR90",
		"custom_nyancat_rainbow.png"
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
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
