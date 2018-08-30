bookshelf = {}

local bookshelf_formspec =
	"size[8,7;]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[context;books;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;books]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,2.85)

function bookshelf.get_bookshelf_formspec(inv)
	local formspec = bookshelf_formspec
	local invlist = inv and inv:get_list("books")
	-- Inventory slots overlay
	local bx, by = 0, 0.3
	for i = 1, 16 do
		if i == 9 then
			bx = 0
			by = by + 1
		end
		if not invlist or invlist[i]:is_empty() then
			formspec = formspec ..
				"image[" .. bx .. "," .. by .. ";1,1;custom_bookshelf_slot.png]"
		end
		bx = bx + 1
	end
	return formspec
end
