-- Register default stairs and slabs

stairs.register_stair_and_slab("wood", "custom:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"custom_wood.png"},
	"Wooden Stair",
	"Wooden Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab("junglewood", "custom:junglewood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"custom_junglewood.png"},
	"Jungle Wood Stair",
	"Jungle Wood Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab("pine_wood", "custom:pine_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"custom_pine_wood.png"},
	"Pine Wood Stair",
	"Pine Wood Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab("acacia_wood", "custom:acacia_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"custom_acacia_wood.png"},
	"Acacia Wood Stair",
	"Acacia Wood Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab("aspen_wood", "custom:aspen_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"custom_aspen_wood.png"},
	"Aspen Wood Stair",
	"Aspen Wood Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab("stone", "custom:stone",
	{cracky = 3},
	{"custom_stone.png"},
	"Stone Stair",
	"Stone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("cobble", "custom:cobble",
	{cracky = 3},
	{"custom_cobble.png"},
	"Cobblestone Stair",
	"Cobblestone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("mossycobble", nil,
	{cracky = 3},
	{"custom_mossycobble.png"},
	"Mossy Cobblestone Stair",
	"Mossy Cobblestone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("stonebrick", "custom:stonebrick",
	{cracky = 2},
	{"custom_stone_brick.png"},
	"Stone Brick Stair",
	"Stone Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("stone_block", "custom:stone_block",
	{cracky = 2},
	{"custom_stone_block.png"},
	"Stone Block Stair",
	"Stone Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("desert_stone", "custom:desert_stone",
	{cracky = 3},
	{"custom_desert_stone.png"},
	"Desert Stone Stair",
	"Desert Stone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("desert_cobble", "custom:desert_cobble",
	{cracky = 3},
	{"custom_desert_cobble.png"},
	"Desert Cobblestone Stair",
	"Desert Cobblestone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("desert_stonebrick", "custom:desert_stonebrick",
	{cracky = 2},
	{"custom_desert_stone_brick.png"},
	"Desert Stone Brick Stair",
	"Desert Stone Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("desert_stone_block", "custom:desert_stone_block",
	{cracky = 2},
	{"custom_desert_stone_block.png"},
	"Desert Stone Block Stair",
	"Desert Stone Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("sandstone", "custom:sandstone",
	{crumbly = 1, cracky = 3},
	{"custom_sandstone.png"},
	"Sandstone Stair",
	"Sandstone Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("sandstonebrick", "custom:sandstonebrick",
	{cracky = 2},
	{"custom_sandstone_brick.png"},
	"Sandstone Brick Stair",
	"Sandstone Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("sandstone_block", "custom:sandstone_block",
	{cracky = 2},
	{"custom_sandstone_block.png"},
	"Sandstone Block Stair",
	"Sandstone Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("obsidian", "custom:obsidian",
	{cracky = 1, level = 2},
	{"custom_obsidian.png"},
	"Obsidian Stair",
	"Obsidian Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("obsidianbrick", "custom:obsidianbrick",
	{cracky = 1, level = 2},
	{"custom_obsidian_brick.png"},
	"Obsidian Brick Stair",
	"Obsidian Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("obsidian_block", "custom:obsidian_block",
	{cracky = 1, level = 2},
	{"custom_obsidian_block.png"},
	"Obsidian Block Stair",
	"Obsidian Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("brick", "custom:brick",
	{cracky = 3},
	{"custom_brick.png"},
	"Brick Stair",
	"Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("steelblock", "custom:steelblock",
	{cracky = 1, level = 2},
	{"custom_steel_block.png"},
	"Steel Block Stair",
	"Steel Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab("copperblock", "custom:copperblock",
	{cracky = 1, level = 2},
	{"custom_copper_block.png"},
	"Copper Block Stair",
	"Copper Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab("bronzeblock", "custom:bronzeblock",
	{cracky = 1, level = 2},
	{"custom_bronze_block.png"},
	"Bronze Block Stair",
	"Bronze Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab("goldblock", "custom:goldblock",
	{cracky = 1},
	{"custom_gold_block.png"},
	"Gold Block Stair",
	"Gold Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab("diamondblock", "custom:diamondblock",
	{cracky = 1},
	{"custom_diamond_block.png"},
	"Diamond Block Stair",
	"Diamond Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(	"meseblock", "custom:mese",
{cracky = 1},
{"custom_mese_block.png"},
	"Mese Block Stair",
	"Mese Block Slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab("concrete", "custom:concrete",
		{cracky=1,level=2, concrete=1},
		{"custom_concrete_block.png"},
		"Concrete Stair",
		"Concrete Slab",
		default.node_sound_stone_defaults()
)


