# quarry
Quarry script for ComputerCraft turtles.

This script aims to the most reliable and self-sufficient way for a mining turtle to dig a quarry with as little human supervision as possible.

# Usage
Easiest way I know of installing quarry in your turtle, is to download the setup script from pastebin:

`pastebin get LcrmJKAn setup`

and then run it, it will download the scripts from this repository.
Then just run `quarry`, there are a few flags you can specify:

`quarry [-m] [-c]`

`-m` indicates to use a modem to broadcast status messages.
`-c` means to use only Charcoal as fuel, if you don't want it to consume any coal it mines.
More flags and customization to come.

# Features
* Automatic refueling, using up coal as needed including coal mined from the ground.
* Inventory management such as item sorting and stacking, dropping out thrash such as cobblestone and dirt when inventory is full, and storing ores and treasures in a chest.
* Tries it's best to come back up when something goes wrong, so you don't have to jump into the pit to rescue the turtle if it gets stuck for instance.
* It digs 3 layers at once by digging forwards, up and down for fuel efficience.
* Optionally broadcasts messages over rednet, such as "Dropping thrash" or "Out of fuel", but it's currently unreliable and doesn't seem to work 100% of the time for me.

# To do
* Remember where it left off in a layer before going up to drop stuff in the chest, so when it comes back doesn't need to "restart" the layer.
* Proper rednet communication with maybe a proper monitor program that prints out a diagram of where the turtle is in real time, with options like "come back up".
* Option not to throw, or specifying what "thrash" is.
* Option to specify layer size, now hard coded as 16x16.
