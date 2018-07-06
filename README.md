# Cashs-World-Code
The mods of the Minetest server Cash's World

The files here are what is actually used by the server.

The server is version: minetest-stable-0.4.16 as of June 2017.<BR>
Compiled in Fedora 25 Intel 64-bit.<BR>
I don't know what the original version of the mods were before I made changes to them.

The code is an absolute mess.

The objective of my changes was to:<BR>
1 - Make it quick and easy to find, modify, insert, or delete items and commands into a server without having to painstakingly examine and modify both the existing code and the new code in multiple directories so that they will work together as desired. Just copy the new files into place, check required library versions, update as required, and you're done.<BR>
2 - Create libraries of related functions that many items in the game can share and use. This stops each item from repeating code. Example: attack functions, movement, chests, etc. Creators of mods were intended to submit changes or additions to the maintainers of the libraries for inclusion into the libraries. IOW: Make your code easily usable by other people.

Use of the 'custom:' Prefix and aliases:<BR>
From what I can remember of over a year ago, I searched for and changed those prefixes that I could find in minetest_game to use the 'custom:' prefix. However, I think the server code uses some 'default:' prefixes itself. I would have to change those before compiling the server.<BR>
The main reason for my use of the 'custom:' prefix was to find where the server's code was making changes to items on the map. Anything not using 'custom:' was to be examined closely. Lots of items were moved into the custom mod without being modified to use the 'custom:' prefix. Mainly due to code that was too complicated for me to understand its function quickly. I meant to come back to them but never did.<BR>
I think that my usage of the large number of aliases is seriously slowing the server down. If anyone is to try using this code, you might want to look for and change usages of item names in the server before compiling it and start with a completely new map. That way you should be able to completely eliminate the usage of prefixes other than 'custom:' and delete the aliases.

Anyone is welcome to use this code. It comes AS IS! I doubt if I will make changes to it. But 'just in case' I do, I'm posting it to github. You can clone this repository, make changes to your copy, clean it up, modify it, etc. Hopefully make it better. Or tell me that what I was trying to do won't work and tell me why it won't.

I am sure changes need to be made so that this code will work with newer versions of Minetest. Modifications to use databases for some functions might be a great idea.

Have fun playing Minetest folks :)
