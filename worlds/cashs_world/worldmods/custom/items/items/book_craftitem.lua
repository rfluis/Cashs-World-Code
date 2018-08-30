
local Info = {
    Name = "book",
    Type = "craft_item",
    Depends_On = "nothing",
}


local Def = {
	description = "Book",
	inventory_image = "custom_book.png",
	groups = {book = 1, flammable = 3},
	on_use = books.book_on_use,
}

local Recipes = {

    Number_Recipes = 1,
    Quantity = {1},
    Shapeless = {false},
    Formula = {
        {
            {'custom:paper'},
            {'custom:paper'},
            {'custom:paper'},
        },
    },
    Replacements = {nil},

    Cooking_Output = "",
    Cook_Time = 0,

    Burn_Time = 3,
}

-- Register this item
RegisterItem(Info, Def, Recipes)
