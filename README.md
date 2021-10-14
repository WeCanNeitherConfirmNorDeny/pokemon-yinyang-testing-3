# pokemon-yinyang-testing-3

pokemon yin/yang (working title)

a simple hack based on the red++ project (check it out at "https://github.com/thefakemateo/rpp-backup")

this hack has 1 or 2 basic goals in mind:
1) have fun
2) ???

some features:
 * dark mode ;)
 * better and shorter intro; a loadscreen for each game -- press a quickly to skip the racing! ;)
 * god items and mythic berries
 * minor fixes and various mods

under the hood:
 * genders have their own stat added to the various '\_struct' macros (the effect is IV strength isn't determined by sex)
 * minor fixes

ideas/todo/in progress:
 * easy mode will be easy (super advantages for the hero)
 * hard mode will be impossible (disadvantageous for the hero)
 * disable/remove all the music (maybe all the sound, i dont use it)
 * quests n minigames n shiii
 * stay tuned ;)

--- HELP SECTION ---

known issues:
 * hella gfx defects! yes i know this!
 * hard mode crashes! for now im ignoring this problem ;)
 * more crashes than normal! im ignoring this problem too, save often ;)

used a yin/yang item and you screen is broken ?:
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

compile trouble?:
 * try 'make clean'
 * if it's a python error related to imports, all i did was change the kind of namespace it loads it as...
	- so if the error says it has trouble importing foo and the line says 'from . import foo' i changed it to 'import foo'

