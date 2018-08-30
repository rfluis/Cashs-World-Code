
local Info = {
    Name = "concrete",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "Concrete",
    inventory_image = "custom_concrete_block.png",
    wield_image = "",
    wield_scale = {x=1,y=1,z=1},
    stack_max = 99,
    range = 4.0,
    liquids_pointable = false,
    tool_capabilities = nil,
    groups = {cracky = 1, level = 2, concrete = 1},
    node_placement_prediction = nil,
    usable = false,
    drawtype = "",
    visual_scale = 1.0,
    tiles = {"custom_concrete_block.png"},
    sounds = default.node_sound_stone_defaults({
        footstep = {name = "custom_concrete_footstep", gain = 0.3},
    }),
}

local Recipes = {
    Number_Recipes = 2,
    Quantity = {4, 2},
    Shapeless = {false, false},
    Formula = {
        {
            {'custom:gravel','custom:rebar','custom:gravel'},
            {'custom:rebar','custom:sand','custom:rebar'},
            {'custom:gravel','custom:rebar','custom:gravel'}
        },

        {
            {'custom:gravel','custom:rebar','custom:gravel'},
            {'custom:rebar','custom:sand','custom:rebar'},
            {'custom:gravel','custom:rebar','custom:gravel'}
        },
    },
    Replacements = {nil, nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
