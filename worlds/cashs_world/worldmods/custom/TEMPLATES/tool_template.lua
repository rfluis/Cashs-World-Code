-- This is only a template

-- This file is to contain definition information specific to a tool.
-- The tools_lib.lua file uses this information to register the item

-- When saving this file as a tool, ensure that the file name ends with '_tool.lua'
-- That will allow the 'item scanner' to find this tool.

-- Refer to docs/Reference.txt for information about the following fields.


-- Ensure that all parameters are cleared before setting them
ClearItemParameters()

Item_Type = "tool"

-- Set the name of this tool and describe it
*Name = ""
*Description = ""
*Inventory_Image = ""
*Wield_Image = ""
*Wield_Scale = {x=1,y=1,z=1}
*Stack_Max = 1
Range = 4.0
*Groups = {}

*Tool_Capabilities = nil
--[[
Tool_Capabilities = {
    full_punch_interval = 1.0,
    max_drop_level = 0,
    groupcaps = {
        fleshy = {times={[1]=1.0, [2]=2.00, [3]=1.00}, uses=0, leveldiff=0, maxlevel=1},
        crumbly = {times={[1]=1.0, [2]=2.00, [3]=1.00}, uses=0, leveldiff=0, maxlevel=1},
        snappy = {times={[1]=1.0, [2]=2.00, [3]=1.00}, uses=0, leveldiff=0, maxlevel=1},
        oddly_breakable_by_hand = {times={[1]=1.0, [2]=2.00, [3]=1.00}, uses=0, leveldiff=0, maxlevel=1},
        cracky = {times={[1]=1.0, [2]=2.00, [3]=1.00}, uses=0, leveldiff=0, maxlevel=1},
        choppy = {times={[1]=1.0, [2]=2.00, [3]=1.00}, uses=0, leveldiff=0, maxlevel=1},
        explody = {times={[1]=1.0, [2]=2.00, [3]=1.00}, uses=0, leveldiff=0, maxlevel=1},
    }
    damage_groups = {fleshy=2}
}
--]]

--Node_Placement_Prediction = nil
Drawtype = ""
Visual_Scale = 1.0
Tiles = {""}
--Special_Tiles
--alpha
--post_effect_color = {a=0, r=0, g=0, b=0}
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

-- The following are boolean (true/false)
Usable = false
*Liquids_Pointable = false
Is_Ground_Content =
Sunlight_Propagates =
Walkable =
Pointable =
Diggable =
Climbable =
Buildable_To =
Floodable =
Legacy_Facedir_Simple =
Legacy_Wallmounted =
Use_Texture_Alpha =
Liquid_Renewable =
Rightclickable =
Air_Equivalent =

LiquidType = "Liquid_Type"
Liquid_Alternative_Flowing = ""
Liquid_Alternative_Source = ""
Drop

-- The following are numeric values
Liquid_Viscosity =
Drowning =
Light_Source =
Damage_Per_Second =
Leveled =
Liquid_Range =

Selection_Box = {""}
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, 1/2, 1/2}
		}

Collision_Box



-- **************************************
-- Recipes - Edit as required
-- **************************************

Number_Recipes = 1

Quantity = {}
Shapeless = {}
Formula = {}
Replacements = {}

Quantity[1] = 6
Shapeless[1] = false
Formula[1] = {
    {'','',''},
    {'','',''},
    {'','',''},
}
Replacements[1] = nil

--Cooking_Output = ""
Cook_Time = 0
Burn_Time = 0

--Additional_Wear = 0



-- **************************************
-- SOUNDS - Simple Sound Spec
-- **************************************
-- P/O Item Definition
--Sound_Place
--Sound_Place_Gain

-- P/O Item Definition
--Sound_Place_Failed
--Sound_Place__Failed_Gain



-- **************************************
-- CALLBACKS
-- Uncomment and insert your code for each one that you
-- want to define a non-default action.
-- **************************************
--[[
On_Drop
On_Place
On_Use
On_Secondary_Use
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
on_craft
on_craft_predict
--]]

Depends_On = ""

-- Register this item
RegisterItem()
