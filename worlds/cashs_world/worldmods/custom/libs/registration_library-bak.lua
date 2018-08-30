-- Every possible thing in a MineTest world is one of the following:
-- Node - These are items that can be placed in the world by right-clicking.
-- Mob - Monsters or other creatures.
-- Tool - Items that players can use.
-- Craft_Item - These are things that can not be placed into a world. They can only be transferred
--              between players, placed in chests, used as fuel, or used in crafting recipes.

-- This file registers each item with the MineTest server.

-- Need the ability to select one of possibly many different
-- functions that perform the same task.
-- Example: Mobs might behave differently and require different functions
-- Maybe label these functions: on_place1, on_place2, on_destruct1, on_destruct2, etc



-- Placing these here prevents warnings about 'Assignment to undeclared global variable inside a function.
-- This makes them declared global variables.
-- This error is caused by code in /builtin/common/strict.lua that rquires global variables to be declared before use.
-- The purpose of this function is to not have so many global variables
-- I can pass the handle of the table to functions that need to use it with: function_name( Reg_Params )
-- This function only sets default values for the tables' members.
-- It does NOT prevent declaring new members of the table
-- either explicitly or by a typo.
function ClearItemParameters ()
--    local Reg_Params = {}
        Item_Type = nil
        Name = nil
        Description = nil
        Inventory_Image = nil
        Wield_Image = nil
        Wield_Scale = nil
        Stack_Max = nil
        Range = nil
        Groups = nil
        Tool_Capabilities = nil
        Node_Placement_Prediction = nil
        Drawtype = nil
        Visual_Scale = nil
        Tiles = nil
        Special_Tiles = nil
        Alpha = nil
        Post_Effect_Color = nil
        NodeBoxType = nil
        Node_Box = nil
        Paramtype = nil
        Paramtype2 = nil
        Usable = nil
        Liquids_Pointable = nil
        Is_Ground_Content = nil
        Sunlight_Propagates = nil
        Walkable = nil
        Pointable = nil
        Diggable = nil
        Climbable = nil
        Buildable_To = nil
        Floodable = nil
        Legacy_Facedir_Simple = nil
        Legacy_Wallmounted = nil
        Use_Texture_Alpha = nil
        Liquid_Renewable = nil
        Rightclickable = nil
        Air_Equivalent = nil
        LiquidType = nil
        Liquid_Alternative_Flowing = nil
        Liquid_Alternative_Source = nil
        Drop = nil
        Liquid_Viscosity = nil
        Drowning = nil
        Light_Source = nil
        Damage_Per_Second = nil
        Leveled = nil
        Liquid_Range = nil
        Selection_Box = nil
        Collision_Box = nil
        Number_Recipes = nil
        Quantity = nil
        Shapeless = nil
        Formula = nil
        Replacements = nil
        Cooking_Output = nil
        Cook_Time = nil
        Burn_Time = nil
        Additional_Wear = nil
        Sound_Place = nil
        Sound_Place_Gain = nil
        Sound_Place_Failed = nil
        Sound_Place_Failed_Gain = nil
        Sound_Footstep = nil
        Sound_Footstep_Gain = nil
        Sound_Dig = nil
        Sound_Dig_Gain = nil
        Sound_Dug = nil
        Sound_Dug_Gain = nil
        On_Drop = nil
        On_Place = nil
        On_Use = nil
        On_Secondary_Use = nil
        On_Construct = nil
        On_Destruct = nil
        After_Destruct = nil
        After_Place_Node = nil
        After_Dig_Node = nil
        Can_Dig = nil
        On_Punch = nil
        On_Rightclick = nil
        On_Dig = nil
        On_Timer = nil
        On_Recieve_Fields = nil
        Allow_Metadata_Inventory_Move = nil
        Allow_Metadata_Inventory_Put = nil
        Allow_Metadata_Inventory_Take = nil
        On_Metadata_Inventory_Move = nil
        On_Metadata_Inventory_Offer = nil
        On_Metadata_Inventory_Put = nil
        On_Metadata_Inventory_Take = nil
        On_Blast = nil
        On_Craft = nil
        On_Craft_Predict = nil
    -- Return the handle to the table
--    return { Reg_Params }
end


-- Register an item
-- Call the appropriate MineTest register function based on what the item is.
-- Need to insert error checking code

function RegisterItem ()

--    local Params = Handle
    -- Need an if statement to register normal craft also

    -- Debugging use. Delete when no longer needed:
    print("Hanlde.Name equals " .. Name)
    --print("Description = " .. Description)
    --print("Inventory_Image = " .. Inventory_Image)

    if Item_Type == "craft_item" then
        minetest.register_craftitem(modname .. ":" .. Name, {
            description = Description,
            inventory_image = Inventory_Image,
            wield_image = Wield_Image,
            wield_scale = Wield_Scale,
            stack_max = Stack_Max,
            liquids_pointable = Liquids_Pointable,
            tool_capabilities = Tool_Capabilities,
            groups = Groups,
            sound_place = {Sound_Place, gain = Sound_Place_Gain},
            sound_place_failed = {Sound_Place, gain = Sound_Place_Failed_Gain},
            range = Range,
            node_placement_prediction = Node_Placement_Prediction,
            usable = Usable,
            on_drop = On_Drop,
            on_place = On_Place,
            on_use = On_Use,
            on_secondary_use = On_Secondary_Use,
        })
    end

    if Item_Type == "tool" then
        minetest.register_tool(modname .. ":" .. Name, {
            description = Description,
            inventory_image = Inventory_Image,
            wield_image = Wield_Image,
            wield_scale = Wield_Scale,
            stack_max = Stack_Max,
            liquids_pointable = Liquids_Pointable,
            tool_capabilities = Tool_Capabilities,
            groups = Groups,
            sound_place = Sound_Place,
            sound_place_failed = Sound_Place_Failed,
            range = Range,
            node_placement_prediction = Node_Placement_Prediction,
            usable = Usable,
            on_drop = On_Drop,
            on_place = On_Place,
            on_use = On_Use,
            on_secondary_use = On_Secondary_Use,
        })
    end

    if Item_Type == "node" then
        minetest.register_node(modname .. ":" .. Name, {
            description = Description,
            -- Is this required?
            inventory_image = Inventory_Image,
            wield_image = Wield_Image,
            wield_scale = Wield_Scale,
            stack_max = Stack_Max,
            liquids_pointable = Liquids_Pointable,
            tool_capabilities = Tool_Capabilities,
            groups = Groups,
            sound_place = Sound_Place,
            sound_place_failed = Sound_Place_Failed,
            range = Range,
            node_placement_prediction = Node_Placement_Prediction,
            usable = Usable,
            drawtype = Drawtype,
            visual_scale = Visual_Scale,
            tiles = Tiles,
            special_tiles = Special_Tiles,
            alpha = Alpha,
            post_effect_color = Post_Effect_Color,
            nodeboxtype = NodeBoxType,

--            type = "regular"

--            type = "fixed",
--            fixed = box OR {box1, box2, ...}

--            type = "wallmounted",
--            wall_top = box,
--            wall_bottom = box,
--            wall_side = box

--            type = "connected",
--            fixed = box OR {box1, box2, ...},
--            connect_top = box OR {box1, box2, ...}
--            connect_bottom = box OR {box1, box2, ...}
--            connect_front = box OR {box1, box2, ...}
--            connect_left = box OR {box1, box2, ...}
--            connect_back = box OR {box1, box2, ...}
--            connect_right = box OR {box1, box2, ...}

            node_box = Node_Box,
            paramtype = Paramtype,
            paramtype2 = Paramtype2,
            is_ground_content = Is_Ground_Content,
            sunlight_propagates = Sunlight_Propagates,
            walkable = Walkable,
            pointable = Pointable,
            diggable = Diggable,
            climbable = Climbable,
            buildable_to = Buildable_To,
            floodable = Floodable,
            liquidtype = LiquidType,
            liquid_alternative_flowing = Liquid_Alternative_Flowing,
            liquid_alternative_source = Liquid_Alternative_Source,
            liquid_viscosity = Liquid_Viscosity,
            drowning = Drowning,
            light_source = Light_Source,
            damage_per_second = Damage_Per_Second,
            selection_box = Selection_Box,
            legacy_facedir_simple = Legacy_Facedir_Simple,
            legacy_wallmounted = Legacy_Wallmounted,
            use_texture_alpha = Use_Texture_Alpha,
            liquid_renewable = Liquid_Renewable,
            leveled = Leveled,
            liquid_range = Liquid_Range,
            drop = Drop,
            rightclickable = Rightclickable,
            air_equivalent = Air_Equivalent,
            collision_box = Collision_Box,
            on_drop = On_Drop,
            on_place = On_Place,
            on_use = On_Use,
            on_secondary_use = On_Secondary_Use,
            on_construct = On_Construct,
            on_destruct = On_Destruct,
            after_destruct = After_Destruct,
            after_place_node = After_Place_Node,
            after_dig_node = After_Dig_Node,
            can_dig = Can_dig,
            on_punch = On_Punch,
            on_rightclick = On_Rightclick,
            on_dig = On_Dig,
            on_timer = On_Timer,
            on_receive_fields = On_Receive_Fields,
            allow_metadata_inventory_move = Allow_Metadata_Inventory_Move,
            allow_metadata_inventory_put = Allow_Metadata_Inventory_Put,
            allow_metadata_inventory_take = Allow_Metadata_Inventory_Take,
            on_metadata_inventory_move = On_Metadata_Inventory_Move,
            on_metadata_inventory_offer = On_Metadata_Inventory_Offer,
            on_metadata_inventory_put = On_Metadata_Inventory_Put,
            on_metadata_inventory_take = On_Metadata_Inventory_Take,
            on_blast = On_Blast,
        })
    end


-- **********************************
-- Need to allow for multiple recipes
-- **********************************

    if Number_Recipes ~= 0 then
        for i=1,Number_Recipes do
            -- 'Shaped' is not defined by the developers
            if Shapeless[i] == true then
                minetest.register_craft({
                    type = "Shapeless",
                    output = modname .. ":" .. Name .. " " .. Quantity[i],
                    recipe = Formula[i],
                    replacements = Replacements[i],
                })
            else
                minetest.register_craft({
                    output = modname .. ":" .. Name .. " " .. Quantity[i],
                    recipe = Formula[i],
                    replacements = Replacements[i],
                })
            end
        end
    end


    if Cook_Time ~= 0 then
        minetest.register_craft({
        type = "cooking",
        output = Cooking_Output,
        recipe = Name,
        cooktime = Cook_Time,
        })
    end

    if Burn_Time ~= 0 then
        minetest.register_craft({
        type = "fuel",
        recipe = Name,
        burntime = Burn_Time,
        })
    end

--    if Additional_Wear ~= 0 then
--        minetest.register_craft({
--            type = "toolrepair",
--            additional_wear = Additional_Wear,
--        })
--    end


-- Nodes will be called stairs:{stair,slab}_<subname>
-- Requires the stairs mod
    function custom.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, sounds)
        stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
        stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
    end


end
