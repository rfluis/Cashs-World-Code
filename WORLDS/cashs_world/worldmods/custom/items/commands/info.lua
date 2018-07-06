-- Misc custom commands, code, etc


-- author: rnd 27 June 2016
minetest.register_chatcommand("info", {
    params = "",
	description = "Chat command to show your coordinates. Author: rnd",
	privs = {
		interact = true
	},
	func = function(name, param)
		local player = minetest.get_player_by_name(name);
		local pos = player:getpos();
		minetest.chat_send_player(name, "position " .. math.floor(pos.x) .. " " .. math.floor(pos.y) .. " " .. math.floor(pos.z));
	end
});
