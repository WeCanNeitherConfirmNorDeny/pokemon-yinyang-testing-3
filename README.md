# pokemon-yinyang-testing-3

pokemon yin/yang (working title)

a simple hack based on the red++ project (check it out at "https://github.com/thefakemateo/rpp-backup")

this hack has 1 or 2 basic goals in mind:
1) have fun
2) ???
3) become a kajillionaire or...a trillionaire...if i have to

QUICK ABOUT:
 * Please remember my english isn't so good ;)
 * Keep in mind this project is way above alpha so...things may not properly function or they may be out of order.
 * Until the game is playable from start to finish (i.e. doesn't crash) and has most of the planned features, I will keep it on the level "testing" and retain "debugging" mode advantages (e.g. starting with all the best items & the level 50 ninetales).
 * i only work while drunk ash, so it may happen i made a change that i didnt know about jajajjaja

major features:
 * dark mode, plus window enhancements ;)
 * better and shorter intro
 * god items and mythic berries

more details:
 * easy mode will be easy (super advantages for the hero...)
 * hard mode will be impossible (disadvantageous for the hero...)
 * play as ash/yin in easy mode
 * play as gary/yang in hard mode (i basically just changed the sprites/palettes so it's not perfect, at the moment)
 * ashley/leaf is the same in either mode, she isn't canon to these games so i'll leave it be
 * a loadscreen for each game -- press a quickly to skip the racing! ;)
 * choose how your trading pokemon obey from the option window! ;) (the whole menu is kind of different now but its not really different...)
 * minor fixes and various mods
 * stay tuned ;)

under the hood:
 * the wMonH/BaseStat... vars were collected into their own object (the header_struct) (works!)
 * gender ratios are added to each pokemons base stat (with an element in header_struct to account for it) (works!)
 * genders have their own stat added to the various '\_struct' macros (the effect is IV strength isn't determined by sex) (still buggy! and trying various methods to get it working)
 * implemented a more dynamic window/menu system (in progress) (the effect is to prepare for the RPG system)
 * replaced hardcodes (as i encountered them) with existing contants or using repeat macros (low priority) (the effect is to make a more versatile code base)
 * wram has so many changes -- it is almost alien now

todo - current priorities:
 * revamp/refactor the way stats and pokemon data are stored/accessed (the effect is so that it's easier to make data structure changes)
 * revamp/tweak the windowing/menuing system to be more flexible (in progress)

ideas/todo - low priority:
 * quests, minigames, n shiiii
 * disable/remove all the music (maybe all the sound, i dont use it)
 * remove all the logic for hiding the ":L" and make it always show
 * move away from all the bcd logic
 * add new items, story narratives, characters, and climaxes, wich are dynamic or entangled (low priority)
 	-- add new items & playable characters
 	-- make new story narratives and climax
 * disallow selling random items to pokemarts (low priority)
 	-- maybe overhaul the whole shop system
 	-- how often can you sell products to your local "mart"? (it makes no sense)
 * disable/remove all the link battle stuff (who in hell is linking physical gameboys in current year?)

--- HELP SECTION ---

known issues:
 * hella gfx defects! yes i know this!
 * hard mode crashes! for now im ignoring this problem ;)

used a yin/yang item and you screen is broken ?
 * try open the "pokemon" menu then exit
 * im looking at some of the causes (usually its a stack related) but it's a low priority for now since it doesn't affect gameplay

to install and build:
 * download the master zip at the Red++ project ("https://github.com/TheFakeMateo/rpp-backup/archive/refs/heads/master.zip")
 * as well as the files in the extras (click the link)
 * download the rgbds assembler tools
 * cygwin for make, python 2.7 bash or linux
 * make a folder for the red++ files and then copy my files over it
 * run make
 	$ nice -13 make -j$(($(nproc) +1)); echo exit: $?; echo; date

compile trouble?
 * try 'make clean'
 * if it's a python error related to imports, all i did was change the kind of namespace it loads it as...
	- so if the error says it has trouble importing foo and the line says 'from . import foo' i changed it to 'import foo'
