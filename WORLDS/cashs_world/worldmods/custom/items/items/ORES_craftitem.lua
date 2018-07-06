--[[

ores
stones
metals
dirt
sand
gravel
water,snow,ice
corals
trees
farming
lava
ladders
fences
walls
chests
flowers
tools

Order of file:
Default ore parameters
parameters specific to each ore
call registration function for each ore
exit

--]]

local Default_Info = {
-- The name of this item. Leave blank if defining the hand.
    Name = "concrete",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Default_Def = {
    -- Set the name of this craftitem and describe it.
    Name = ""
    Description = ""
    Inventory_Image = ""
    Wield_Image = ""
    Wield_Scale = {x=1,y=1,z=1}
    Stack_Max = 99
    Range = 4.0
    Groups = {}

    Tool_Capabilities = nil

    Node_Placement_Prediction = nil
    Usable = false
    Liquids_Pointable = false


    -- **************************************
    -- SOUNDS - Simple Sound Spec
    -- **************************************
    -- P/O Item Definition
    --Sound_Place = "place_node"
    --Sound_Place_Gain = 1.0

    -- P/O Item Definition
    --Sound_Place_Failed =
    --Sound_Place__Failed_Gain = 1.0


    -- **************************************
    -- CALLBACKS
    -- Uncomment and insert your code for each one that you
    -- want to define a non-default action.
    -- **************************************

    --On_Drop
    --On_Place
    --On_Use
    --On_Secondary_Use
}

local Default_Recipes = {
    -- **************************************
    -- Recipes - Edit as required
    -- **************************************

    Number_Recipes = 1

    Quantity = {}
    Shapeless = {}
    Formula = {}
    Replacements = {}

    Quantity[1] = 0,
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
}

-- Ensure that all parameters are cleared before setting them
ClearItemParameters()


-- Register this item
RegisterItem(Info, Def, Recipes)
