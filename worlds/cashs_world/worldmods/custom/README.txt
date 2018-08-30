OBJECTIVES of this mod:
1 - Mandatory: Have the ability to add or delete items easily by simply removing their image and other files: sounds, images, etc.
2 - Create common scripts (library files) that are named according to the type of item that the script can work with. The idea is to allow many items to share common functions so that any bug fixes to a function will hopefully fix every item that uses those functions. Likely based upon the item type as specified in MT register_node API:

Stairs and slabs are optional items that are created when a (parent) node is created.
Stairs and slabs do not require their own definition file. A flag is set in the definition file to create them.

Any items added are to use those scripts.
Error check only once for each item. IOW If using a mitril axe, check for mithril only once. The server needs to keep a table of what has already been checked. Prefer to do this at server start.
Maybe use a bat file that scans subdirectories for items and places all items found into a table to be used by the init.lua file which then registers the items. That might be a faster method of starting the server.


TODO:
Credit where credit is due and licensing:
List the mods that this is based upon.
Find and check the licenses of all the mods that this is based upon.
Mods that were made a part of this mod:
Concrete, rebar, and truss from ???
afkkick
failing from GoldFireUn
spawn from VanessaE and cheapie
chat_anti_curse
chat2
names_per_ip
sethome
reserved_slots_enhanced
money2
wool
walls
screwdriver
nyancat
give_initial_stuff
dyes
beds
farming
stairs
xpanes
vessels
bucket
boat
bones
flowers
city_block
doors
carts
sfinv
protector


Program Flow:
Custom_Mods/init.lua
	Describe what this lua file does


Files required or optional for each item include:
Init - Mandatory file. Contains: Dependency info
Textures
Sounds
locale


Each file in the Items directory contains:
The 'item' might be only a command and not contain or define anything else.
Each item contains information that defines what it is. This information can contain:
Item Type (ore, vegetation, mob, tool. This determines which library will be used.
Optional: Items required by this item that is being added AKA the items's recipe. Example: A mithril axe needs mitril ingots.
Pointers to image, sound, and texture files.
What type of items can be made using this item: weapons, tools, etc


ITEM CLASSIFICATION LIST & what information is required for each item type:
Ores
	File Name: ore_OreName.lua EX: ore_tin.lua
	recipe

Trees and other vegetation: crops, grass, etc
Mobs
Tools
Liquids
weapons

I was creating a registration_library file that would register each item. This idea was abandoned when I discovered that minetest.register_item function
can accept a variable number custom fields.

GENERAL NOTES:
To enable or disable mods for a particular world, edit the world's world.mt file.

One method of getting this mod to work might be to execute a 'master file' that
scans for files that end in '_tool', '_mob', '_ore', etc.


To call a function from init in another .lua file use modular classes. This emulates class and object behaviour in lua and keeps things a lot neater.

File 'myOtherLuaFile.lua' that is called by init.lua:

local publicClass={};

function publicClass.helloWorld()
    print("Hello World");
end;

return publicClass;


In 'init.lua'

local myClass = require("scripts.myOtherLuaFile");
myClass.helloWorld();

"scripts.myOtherLuaFile" uses dot notation for the path, so "scripts/interface/other/myOtherLuaFile.lua" becomes "scripts.interface.other.myOtherLuaFile".
