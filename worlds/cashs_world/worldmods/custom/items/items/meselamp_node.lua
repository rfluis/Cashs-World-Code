
local Info = {
    Name = "meselamp",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Mese Lamp",
    stack_max = 99,
    groups = {cracky = 3, oddly_breakable_by_hand = 3},
    drawtype = "glasslike",
    tiles = {"custom_meselamp.png"},
    paramtype = "light",
    is_ground_content = false,
    sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'', 'custom:mese_crystal_fragment',''},
            {'custom:mese_crystal_fragment', 'custom:glass', 'custom:mese_crystal_fragment'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
