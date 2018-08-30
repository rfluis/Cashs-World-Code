-- Minetest mod "City block"
-- City block disables use of water/lava buckets and also sends aggressive players to jail
--2016.02 - improvements suggested by rnd. removed spawn_jailer support. some small fixes and improvements.

--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 2.1 of the License, or (at your option) any later version.

city_block={}
city_block.blocks={}
city_block.filename = minetest.get_worldpath() .. "/city_blocks.txt"

function city_block:save()
    local datastring = minetest.serialize(self.blocks)
    if not datastring then
        return
    end
    local file, err = io.open(self.filename, "w")
    if err then
        return
    end
    file:write(datastring)
    file:close()
end

function city_block:load()
    local file, err = io.open(self.filename, "r")
    if err then
        self.blocks = {}
        return
    end
    self.blocks = minetest.deserialize(file:read("*all"))
    if type(self.blocks) ~= "table" then
        self.blocks = {}
    end
    file:close()
end

function city_block:in_city(pos)
    for i, EachBlock in ipairs(self.blocks) do
        if pos.x > (EachBlock.pos.x - 22) and pos.x < (EachBlock.pos.x + 22) and pos.z > (EachBlock.pos.z - 22) and pos.z < (EachBlock.pos.z + 22) and
        pos.y > (EachBlock.pos.y - 10) then
            return true
        end
    end
    return false
end

function city_block:city_boundaries(pos)
    for i, EachBlock in ipairs(self.blocks) do
        if (pos.x == (EachBlock.pos.x - 21) or pos.x == (EachBlock.pos.x + 21)) and pos.z > (EachBlock.pos.z - 22) and pos.z < (EachBlock.pos.z + 22 ) then
            return true
        end
        if (pos.z == (EachBlock.pos.z - 21) or pos.z == (EachBlock.pos.z + 21)) and pos.x > (EachBlock.pos.x - 22) and pos.x < (EachBlock.pos.x + 22 ) then
            return true
        end
    end
    return false
end

city_block:load()

minetest.register_node("city_block:cityblock", {
	description = "City block mark area 45x45 in size as part of city",
	tiles = {"cityblock.png"},
	is_ground_content = false,
	groups = {cracky=1,level=3},
    is_ground_content = false,
	light_source = LIGHT_MAX,

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
})

minetest.register_craft({
	output = 'city_block:cityblock',
	recipe = {
		{'custom:pick_mese', 'farming:hoe_mese', 'custom:sword_mese'},
		{'custom:sandstone', 'custom:goldblock', 'custom:sandstone'},
		{'custom:stonebrick', 'custom:mese', 'custom:stonebrick'},
	}
})


local old_bucket_water_on_place=minetest.registered_craftitems["bucket:bucket_water"].on_place
minetest.registered_craftitems["bucket:bucket_water"].on_place=function(itemstack, placer, pointed_thing)
	local pos = pointed_thing.above
	if city_block:in_city(pos) then
        minetest.chat_send_player(placer:get_player_name(), "Don't do that in town!")
        return itemstack
	else
		return old_bucket_water_on_place(itemstack, placer, pointed_thing)
	end
end
local old_bucket_lava_on_place=minetest.registered_craftitems["bucket:bucket_lava"].on_place
minetest.registered_craftitems["bucket:bucket_lava"].on_place=function(itemstack, placer, pointed_thing)
	local pos = pointed_thing.above
	if city_block:in_city(pos) then
        minetest.chat_send_player(placer:get_player_name(), "Don't do that in town!")
        return itemstack
	else
		return old_bucket_lava_on_place(itemstack, placer, pointed_thing)
	end
end



--do not let lava flow across boundary of city block
minetest.register_abm({
	nodenames = {"custom:lava_flowing"},
	interval = 5,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
        if pos.y>14 and city_block:city_boundaries(pos) then
            minetest.set_node(pos, {name="custom:stone"})
        end
	end,
})


-- Added by JDC
--do not let water flow across boundary of city block
-- Why did I comment this out?
--[[
minetest.register_abm({
	nodenames = {"custom:water_flowing"},
	interval = 5,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
        if pos.y>14 and city_block:city_boundaries(pos) then
            minetest.set_node(pos, {name="custom:stone"})
        end
	end,
})
--]]
