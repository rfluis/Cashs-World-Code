--[[
reserved_slots_enhanced mod for MineTest
Based on code by rubenwardy posted in:
https://forum.minetest.net/viewtopic.php?f=5&t=10037

Copyright 2016 John Coleman <jdc843@sccoast.net>

This program is distributed under the terms of the GNU General Public License Version 3
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]


reserved_slots_enhanced = {}

-- Stay below version 1.0 while this mod is considered a Work In Progress mod (WIP)
reserved_slots_enhanced.version = 0.1

local Number_Slots = 4



-- Ensure that the original reserved_slot mod is not loaded
-- Too bad that the minetest.register_privilege function doesn't return a value showing success or failure
-- That would make this test better. Then I could check to see if another mod registered that priv.
if (minetest.get_modpath("reserved_slot") ~= nil) or (minetest.get_modpath("reserved_slots") ~= nil) then
    minetest.log("error", "reserved_slots_enhanced: ********** Conflicting mod detected! **********")
    -- Is there a better way to do this? I don't want to request a shutdown. I want to force a shutdown.
    minetest.request_shutdown()
end



if (minetest.setting_get("reserved_slots") == nil) then
    minetest.log("info", "reserved_slots_enhanced: reserved_slots value is not set. Using default value set in mod's init.lua file")
else
    Number_Slots = minetest.setting_get("reserved_slots")
end



-- Don't check for Number_Slots > max_users.



minetest.register_privilege("reserved_slot", {
    description = "Allow specific players to always be able to log in",
    give_to_single_player = true,
})



-- All players execute this code. This includes the admin and any privileged players.
minetest.register_on_prejoinplayer(function(name, ip)

    -- Always allow the admin, privileged, and favored players to log on.
    -- This depends on their having the reserved_slot priv.
    if minetest.check_player_privs(name, {reserved_slot = true}) then
        return
    end

    -- Player trying to log in is not the admin, a privileged player, or a favored player

    -- If Number_Slots = 0, allow the connection
    if Number_Slots == 0 then
        return
    end

    -- Find out how many players are currently on that have the reserved_slot priv
    -- We subtract the number that are from Number_Slots because we don't need that many reserved slots now.
    local found = 0
    for _, player in ipairs(minetest.get_connected_players()) do
        if minetest.get_player_privs(player:get_player_name()).reserved_slot then
            found = found + 1
        end
    end

-- ERROR: Attempt to compare string with number. I got this error when I set reserved_slots in the conf file
    if found > Number_Slots then
        minetest.log("info", "reserved_slots_enhanced: You have more players with the reserved_slot priv than you have Number_Slots.")
        minetest.log("info", "reserved_slots_enhanced: You might want to increase the value of Number_Slots or reserved_slots.")
    end

    -- See if this player can log in
    -- I am subtracting 1 to match what /src/network/serverpackerhandler.cpp does to keep a slot open. But do I really have to do that?
    if (#minetest.get_connected_players() < (minetest.setting_get("max_users") - Number_Slots + found - 1)) then
        return
    end

    return "Too many users on this server"
end)

minetest.log("reserved_slots_enhanced mod loaded")
