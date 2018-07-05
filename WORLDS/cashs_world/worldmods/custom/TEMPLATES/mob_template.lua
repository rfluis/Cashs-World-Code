-- This is only a template

-- This file is to contain definition information specific to a mob.
-- The registration_library.lua file uses this information to register the item

-- When saving this file as a mob, ensure that the file name ends with '_mob.lua'
-- That will allow the 'item scanner' to find the item.

-- Refer to docs/Reference.txt for information about the following fields.


-- Ensure that all parameters are cleared before setting them
ClearItemParameters()

Item_Type = "mob"

-- Set the name of this mob and describe it.
Name = ""
Description = ""
Inventory_Image = ""
Wield_Image = ""
Wield_Scale = {x=1,y=1,z=1}
Stack_Max = 99
Liquids_Pointable = false
Tool_Capabilities = {
    full_punch_interval = 1.0,
    max_drop_level = 0,
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
Groups = {}
Node_Placement_Prediction = ""
Usable = false
Drawtype = ""
Visual_Scale = 1.0
Tiles = {""}
Special_Tiles
alpha
post_effect_color = {a=0, r=0, g=0, b=0}
NodeBoxType = ""

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
}

Node_Box = {"Groups"}
Paramtype = "Paramtype"
Paramtype2 = "Paramtype2"
bool is_ground_content
bool sunlight_propagates
bool walkable
bool pointable
bool diggable
bool climbable
bool buildable_to
bool floodable
LiquidType = "Liquid_Type"
liquid_alternative_flowing
liquid_alternative_source
liquid_viscosity
Drowning
light_source
damage_per_second
Selection_Box = {""}
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, 1/2, 1/2}
		}
Legacy_Facedir_Simple
Legacy_Wallmounted
bool use_texture_alpha
bool liquid_renewable
leveled
liquid_range
drop
bool rightclickable
Air_Equivalent
collision_box


-- **************************************
-- Recipes - Edit as required
-- **************************************
Quantity = 6,
Formula = {
    {'','','steel_ingot'},
    {'','steel_ingot',''},
    {'steel_ingot','',''},
},

Replacements = ""
bool Shapeless
Cooking_Output = ""
Cook_Time = 0
Burn_Time = 0
Additional_Wear = 0


-- **************************************
-- SOUNDS
-- **************************************
-- P/O Item Definition
Sound_Place
Sound_Place_Gain

-- P/O Item Definition
Sound_Place_Failed
Sound_Place__Failed_Gain

-- P/O Node Definition
Sound_Footstep
Sound_footstep_Gain

-- P/O Node Definition
Sound_Dig
Sound_Dig_Gain

-- P/O Node Definition
Sound_Dug
Sound_Dug_Gain




-- **************************************
-- CALLBACKS for item definitions
-- Uncomment and insert your code for each one that you
-- want to define a non-default action.
-- **************************************

On_Drop
On_Place
On_Use
On_Secondary_Use




-- **************************************
-- CALLBACKS for node definitions
-- Uncomment and insert your code for each one that you
-- want to define a non-default action.
-- **************************************

on_construct
on_destruct
after_destruct
after_place_node
after_dig_node
can_dig
on_punch
on_rightclick
on_dig
on_timer
on_receive_fields
allow_metadata_inventory_move
allow_metadata_inventory_put
allow_metadata_inventory_take
on_metadata_inventory_move
on_metadata_inventory_offer
on_metadata_inventory_put
on_metadata_inventory_take
on_blast

-- Callbacks that I can't find references to. Are these obsolete?
on_craft
on_craft_predict



-- Need the ability to select one of possibly many different
-- functions that perform the same task.
-- Example: Mobs might behave differently and require different functions
-- Maybe label these functions: on_place1, on_place2, on_destruct1, on_destruct2, etc

-- This was added by me - JDC
Depends_On = ""

-- Register this item
RegisterItem()
