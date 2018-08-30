--[[

PROBLEMS:
    1 - Players create multiple accounts. This causes multiple problems that will not be listed here.
    2 - Players often have their accounts 'hacked' or taken over by hostile players that log in to an account and take control of that account.

GOALS:
    1 - Limit the number of accounts that each player can create.
    2 - Determine who is the true owner of an account.

CONDITIONS:
Normal 'law-abiding' player.
Players get around this limit by having another player create an account and 'giving' the account back to the first player.
One player could help another player set or change a password. This would cause the first player to be shown as having
    the second players account and count towards the account limit.
ADMIN can do the same
Many players can not create passwords or change their passwords. Client limitation or player ignorance.
Caused by:
    Accounts without passwords.
    Players giving passwords to other players for various reasons and not regaining their accounts
    Weak or easily guessed passwords

ACTIONS DESIRED:
    1 - Limit the number of accounts that can be created by a player

COMMANDS DESIRED:
    1 - Show the information listed below by an account name
    2 - Delete ip addr from an account
    3 - Delete an account from an ip addr
    4 - Import an existing ipnames.txt file used by the original names_per_ip mod
            If a player exists in both files, which one do we keep?
            What if this command is executed more than once?
            Show warning if different addresses?
    5 - Export to the format used by the original names_per_ip mod

INFORMATION REQUIRED:
    1 - Player Name
    2 - IP Address used when creating the account.
    3 - Date & time when the account is created
    4 - Additional IP addresses used for sucessful logins to the account
    5 - Date & time for those sucessful logins

*** Must be capable of converting an existing world's player information recorded in ipnames.txt
When using an old version ipnames.txt file, the first player to log in using the new format might not be the original owner
    ASSUME that the ip addr shown in the old format is the original owner's ip addr. Show a warning about the assumption also

--]]
minetest.register_privilege("whois", {
    description = "Allows player to see other player IPs"})

-- Created by Krock to stop mass-account-creators
-- License: WTFPL

ipnames = {}
ipnames.data = {}
ipnames.tmp_data = {}
ipnames.changes = false
ipnames.save_interval = 120
ipnames.save_time = 0
ipnames.file = minetest.get_worldpath().."/ipnames.txt"

ipnames.name_per_ip_limit = tonumber(minetest.setting_get("max_names_per_ip")) or 5

-- Get accounts self:
minetest.register_chatcommand("whois", {
	description = "Gets all players who have the same IP as the specified player",
	privs = {whois = true},
	func = function(name, param)
		if not ipnames.data[param] then
			minetest.chat_send_player(name, "The player \"" .. param .. "\" did not join yet.")
			return
		end

		local ip = ipnames.data[param][1]
		-- Added a space to help make the output more readable
		minetest.chat_send_player(name, " ")
		minetest.chat_send_player(name, "Players for IP address " .. ip .. ":")
        minetest.chat_send_player(name, "Date:" .. "                    " .. "Player Name:")
		local names = "";
		for k, v in pairs(ipnames.data) do
			if v[1] == ip then
                -- Handle old & new format ipnames.txt data
                if v[3] ~= nil then
                    minetest.chat_send_player(name, v[3] .. "  " .. k)
                else
                    minetest.chat_send_player(name, "Unknown" .. "                  " .. k)
                end
			end
		end
--		minetest.chat_send_player(name, names)
	end,
})

-- Get IP if player tries to join, ban if there are too much names per IP:
minetest.register_on_prejoinplayer(function(name, ip)
	-- Only stop new accounts:
	ipnames.tmp_data[name] = ip
	if not ipnames.data[name] then
		local count = 1
		local names = ""
		for k, v in pairs(ipnames.data) do
			if v[1] == ip then
				count = count + 1
				names = names .. k .. ", "
			end
		end

		if count <= ipnames.name_per_ip_limit and count > 1 then
			minetest.log("action", name .. " now has " .. count .. " accounts. Other accounts: " .. names)
		end

		if count > ipnames.name_per_ip_limit then
			ipnames.tmp_data[name] = nil
			if tostring(ip) ~= "127.0.0.1" then
				return ("\nYou exceeded the limit of accounts (" .. ipnames.name_per_ip_limit ..
				").\nYou already have the following accounts:\n" .. names)
			end
		end
	end
end)

-- Save IP if player joined:
minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
    local t1 = os.time()
    local t2 = os.date("%b %d %Y %X", t1)
	ipnames.data[name] = {ipnames.tmp_data[name], t1, t2}
	ipnames.tmp_data[name] = nil
	ipnames.changes = true
end)

-- Old format: Player name, player IP address
-- New format: Player name, player IP address, date in secs, date human readable
function ipnames.load_data()
	local file = io.open(ipnames.file, "r")
	if not file then
		return
	end
	local t = os.time()
	for line in file:lines() do
		if line ~= "" then
			local data = line:split("|")
			-- Support old format w/o timestamp
            -- Fields that receive no data are set to nil.
            -- Player names are used as the key to ipnames.data table.
            -- data[data[1]]'s key is the player name. The value is the handle to the table containing data[2-4]
            ipnames.data[data[1]] = {data[2], data[3], data[4]}
		end
	end
    minetest.log("names per IP ADDR database loaded")
	io.close(file)
end

-- This function erases the file. Then it rewrites it.
function ipnames.save_data()
	if not ipnames.changes then
		return
	end
	ipnames.changes = false
	local file = io.open(ipnames.file, "w")
	for i, v in pairs(ipnames.data) do
		if v[2] ~= nil then
            -- This player has logged in since the new format was implemented
			file:write(i .. "|" .. v[1] .. "|" .. v[2] .. "|" .. v[3] .. "\n")
        else
            -- This player has not logged in since the new format was implemented
            file:write(i .. "|" .. v[1] .. "\n")
		end
	end
	io.close(file)
end

minetest.register_globalstep(function(t)
	ipnames.save_time = ipnames.save_time + t
	if ipnames.save_time < ipnames.save_interval then
		return
	end
	ipnames.save_time = 0
	ipnames.save_data()
end)

minetest.register_on_shutdown(function() ipnames.save_data() end)

minetest.after(3, function() ipnames.load_data() end)
