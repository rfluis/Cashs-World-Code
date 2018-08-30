--This is only a template for craftitems
--These are items that can not be placed in the world.

--This file is to contain definition information specific to a craftitem.
--The registration_library.lua file uses this information to register the item

--When saving this file as a craftitem, ensure that the file name ends with '_craftitem.lua'
--That will allow the 'item scanner' to find the item.

-- Refer to docs/Reference.txt for information about the following fields.



local Info = {
-- The name of this item. Leave blank if defining the hand.
    Name = "concrete",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
    -- Set the name of this craftitem and describe it.
    description = "",
    inventory_image = "",
    wield_image = "",
    wield_scale = {x=1,y=1,z=1},
    stack_max = 99,
    range = 4.0,
    groups = {},

    tool_capabilities = nil,

    node_placement_prediction = nil,
    usable = false,
    liquids_pointable = false,


    -- **************************************
    -- SOUNDS - Simple Sound Spec
    -- **************************************
    -- P/O Item Definition
    --sound_place = "place_node",
    --sound_place_gain = 1.0,

    -- P/O Item Definition
    --sound_place_failed = ,
    --sound_place__failed_gain = 1.0,


    -- **************************************
    -- CALLBACKS
    -- Uncomment and insert your code for each one that you
    -- want to define a non-default action.
    -- **************************************

    --on_drop = ,
    --on_place = ,
    --on_use = ,
    --on_secondary_use = ,
}

local Recipes = {

    -- If this item can be created by crafting, set these to show the recipe(s) used to create this item
    -- Else set Number Recipes = 0. Quantity, Shapeless, Formula, and Replacements fields
    -- are then ignored and can be deleted.
    Number_Recipes = 2,
    --Quantity is how many of this item is created by using the specified recipe
    Quantity = {1, 1},
    Shapeless = {true, false},
    Formula = {
        {
            "custom:glass_bottle",
            "custom:glass_bottle",
        },
        {
            {'group:stone', 'group:stone', 'group:stone'},
            {'group:stone', '', 'group:stone'},
            {'group:stone', 'group:stone', 'group:stone'},
        },
    },
    Replacements = {nil, nil},

    -- Is this item cookable in a furnace?
    -- What you get when this item is cooked.
    Cooking_Output = "",
    -- Cook_Time is in seconds
    --Rudy Ward's guide says the cook time defaults to 3. Though I can't find it in the MT code
    Cook_Time = 0,

    -- Set this if the item can be used as fuel in a furnace
    -- Burn_Time is in seconds
    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
