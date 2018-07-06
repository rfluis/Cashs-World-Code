
local Info = {
    Name = "cityblock",
    Type = "node",
    Depends_On = "nothing",
}

local Def = {
	description = "City block mark area 45x45 in size as part of city",
	tiles = {"custom_cityblock.png"},
	is_ground_content = false,
	groups = {cracky=1,level=3},
    is_ground_content = false,
	light_source = default.LIGHT_MAX,

    after_place_node = function(pos, placer)
        if placer and placer:is_player() then
            table.insert(city_block.blocks, {pos=vector.round(pos), owner=placer:get_player_name()} )
            city_block:save()
        end
    end,
    on_destruct = function(pos)
        for i, EachBlock in ipairs(city_block.blocks) do
            if vector.equals(EachBlock.pos, pos) then
                table.remove(city_block.blocks, i)
                city_block:save()
            end
        end
    end,
}

local Recipes = {
    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
		{'custom:pick_mese', 'custom:hoe_mese', 'custom:sword_mese'},
		{'custom:sandstone', 'custom:goldblock', 'custom:sandstone'},
		{'custom:stonebrick', 'custom:mese', 'custom:stonebrick'}
		},
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 0,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
