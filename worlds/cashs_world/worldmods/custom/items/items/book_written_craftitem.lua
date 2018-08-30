
local Info = {
    Name = "book_written",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
	description = "Book With Text",
	inventory_image = "custom_book_written.png",
	groups = {book = 1, not_in_creative_inventory = 1, flammable = 3},
	stack_max = 1,
	on_use = books.book_on_use,
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {true},
    Formula = {
        {
            "custom:book", "custom:book_written",
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 3,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
