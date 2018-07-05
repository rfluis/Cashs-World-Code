-- This is only a template

-- This file is to contain definition information specific to a node.
-- These are items that can be placed in the world.
-- The registration_library.lua file uses this information to register the item

-- When saving this file as a node, ensure that the file name ends with '_node.lua'
-- That will allow the 'item scanner' to find the item.

-- Refer to docs/Reference.txt for information about the following fields.


local Info = {
-- The name of this item. Leave blank if defining the hand.
    Name = "concrete",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
    description = "",
    inventory_Image = "",
    wield_image = "",
    wield_scale = {x=1,y=1,z=1},
    stack_max = 99,
    range = 4.0,
    groups = {},

    tool_capabilities = nil,

--[[
    tool_capabilities = {
        full_punch_interval = 1.0,
        max_drop_level = 0,
        -- Defines which groups of nodes and entities they are effective towards
        groupcaps = {
            fleshy = {times={[1]=1.0, [2]=2.00, [3]=1.00}, uses=0, leveldiff=0, maxlevel=1},
            crumbly = ditto,
            snappy = ditto,
            oddly_breakable_by_hand = ditto,
            cracky = ditto,
            choppy = ditto,
            explody = ditto,
        }
        damage_groups = {fleshy=2}
    }
--]]

--node_placement_prediction = nil
    drawtype = "normal",
    visual_scale = 1.0,
    tiles = {""},
--special_tiles,
--alpha = 255,
--post_effect_color = {a=0, r=0, g=0, b=0},
    nodeboxtype = "",

-- PICK ONE AND FILL IN THE DATA:
  type = "regular"
    {
    }

    type = "fixed",
    fixed = box OR {box1, box2, ...}
			fixed = {
				{1/2, -1/2, -1/2, 1/2, 1/2, 1/2},
				{-1/2, 1/2, -1/2, 1/2, 1/2, 1/2},
				{-1/2, -1/2, 1/2, 1/2, 1/2, 1/2},
				{-1/2, -1/2, -1/2, -1/2, 1/2, 1/2},
				{-1/2, -1/2, -1/2, 1/2, -1/2, 1/2},
				{-1/2, -1/2, -1/2, 1/2, 1/2, -1/2}
			}

    type = "wallmounted",
    wall_top = box,
    wall_bottom = box,
    wall_side = box

    type = "connected",
    fixed = box OR {box1, box2, ...},
    connect_top = box OR {box1, box2, ...}
    connect_bottom = box OR {box1, box2, ...}
    connect_front = box OR {box1, box2, ...}
    connect_left = box OR {box1, box2, ...}
    connect_back = box OR {box1, box2, ...}
    connect_right = box OR {box1, box2, ...}

    node_box = {"Groups"},
    paramtype = "none",
    paramtype2 = "none",

-- The following are boolean (true/false)
    usable = false,
    liquids_pointable = false,
    is_ground_content = true,
    sunlight_propagates = false,
    walkable = true,
    pointable = true,
    diggable = true,
    climbable = false,
    buildable_to = false,
    floodable = false,
    legacy_facedir_simple = false,
    legacy_wallmounted = false,
    use_texture_alpha =,
    liquid_renewable =,
    rightclickable =,
    air_equivalent =,

    liquidtype = "none",
    liquid_alternative_flowing = "",
    liquid_alternative_source = "",
    drop,

-- The following are numeric values
    liquid_viscosity = 0,
    drowning = 0,
    light_source = 0,
    damage_per_second = 0,
    leveled =,
    liquid_range =,

    selection_box = {type="regular"},
--		selection_box = {
--			type = "fixed",
--			fixed = {-1/2, -1/2, -1/2, 1/2, 1/2, 1/2}
--		}

    collision_box,

-- **************************************
-- SOUNDS - Simple Sound Spec
-- **************************************

-- sounds =,

-- OR

-- P/O Item Definition
--sound_place = "",
--sound_place_gain = 1.0,

-- P/O Item Definition
--sound_place_failed = "",
--sound_place__failed_gain = 1.0,

-- P/O Node Definition
--sound_footstep = "",
--sound_footstep_gain = 1.0,

-- P/O Node Definition
--sound_dig = "",
--sound_dig_gain = 1.0,

-- P/O Node Definition
--sound_dug = "",
--sound_dug_gain = 1.0,




-- **************************************
-- CALLBACKS
-- Uncomment and insert your code for each one that you
-- want to define a non-default action.
-- **************************************
--[[
*on_drop
*on_place
*on_use = nil
on_secondary_use
on_construct
on_destruct
after_destruct
after_place_node
after_dig_node
*can_dig = nil
*on_punch
*on_rightclick = nil
*on_dig
on_timer
*on_receive_fields = nil
allow_metadata_inventory_move
allow_metadata_inventory_put
allow_metadata_inventory_take
*on_metadata_inventory_move
*on_metadata_inventory_offer
on_metadata_inventory_put
*on_metadata_inventory_take
on_blast
on_craft
on_craft_predict
--]]

-- Add your own custom fields. By convention, all custom field names should
-- start with `_` to avoid naming collisions with future engine usage.
}

-- These should be recipes for how to get this item.
-- Not which recipes contain this item.
local Recipes = {

    -- If this item can be created by crafting, set these to show the recipe(s) used to create this item
    -- Else set Number Recipes = 0. Quantity, Shapeless, Formula, and Replacements fields
    -- are then ignored and can be deleted.
    Number_Recipes = 2,
    --Quantity is how many of this item is created by using the specified recipe
    Quantity = {4, 2},
    Shapeless = {true, false},
    Formula = {
        {
            'default:gravel','custom:rebar','default:gravel',
        },
        {
            {'default:gravel','custom:rebar','default:gravel'},
            {'custom:rebar','default:sand','custom:rebar'},
            {'default:gravel','custom:rebar','default:gravel'},
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

--Additional_Wear = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
