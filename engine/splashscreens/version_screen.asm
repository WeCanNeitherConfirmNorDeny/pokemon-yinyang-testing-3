DisplayHackVersionScreen::
; Displays the welcome screen with difficulty and version number info
; Start by clearing and turning off the screen
	call ClearScreen
	call DisableLCD
; load screen palettes
	ld b, SET_PAL_VERSION_SCREEN
	call RunPaletteCommand
	
; load the graphics for the screen
	ld hl, VersionScreenTiles
	ld de, vChars2
	ld bc, VersionScreenTilesEnd - VersionScreenTiles
	call CopyData	
; load the tilemap for the screen
	call CleanPikachuScreen
; turn the screen back on
	call EnableLCD
	call Delay3
	call GBPalNormal
; display the version info text
	coord hl, 2, 2
	ld de, VersionScreenText
	call PlaceString
; wait for the player to press A
	call WaitForTextScrollButtonPress
; load the tilemap for the screen again
	call CleanPikachuScreen
; display the second page
	coord hl, 2, 2
	ld de, VersionScreenText2
	call PlaceString
	; wait for the player to press A
	call WaitForTextScrollButtonPress
; load the tilemap for the screen again
	call CleanPikachuScreen
; display the third page
	coord hl, 2, 6
	ld de, VersionScreenText3
	call PlaceString
	; wait for the player to press A
	call WaitForTextScrollButtonPress
; wipe the screen and go back
	call ClearScreen
	ret

CleanPikachuScreen:
	ld hl, VersionScreenTilemap
	ld de, wTileMap
	ld bc, VersionScreenTilemapEnd - VersionScreenTilemap
	jp CopyData

VersionScreenTiles:
	INCBIN "gfx/version_screen_tiles.2bpp"
VersionScreenTilesEnd:

VersionScreenTilemap:
	INCBIN "gfx/tilemaps/blank_text_screen.kmp"
VersionScreenTilemapEnd:

;VersionScreenText:
;	db   "Welcome to Red++"
;	next "You are playing"
;IF DEF(_HARD) ; Hard Rom
;	next "The Hard Patch"
;ELSE ; Normal Rom
;	next "The Normal Patch"
;ENDC
;IF DEF(_SNOW)
;	next "v3.0.2 (Snowy)@"
;ELSE
;	next "v3.0.2@"
;ENDC
VersionScreenText:
IF DEF(_HARD) ; Hard Rom
	db "#mon Yang"
	next "* HARD MODE"
ELSE ; Normal Rom
	db "#mon Yin"
	next "* EASY MODE"
ENDC
	next " "
	next "based on:"
IF DEF(_SNOW)
	next "Red++V3.0.2 (Snowy)"
ELSE
	next "Red++V3.0.2"
ENDC
	db "@"

VersionScreenText2:
	db   "Readme and FAQ"
	next "www.github.com/TheFakeMateo/rpp-backup"
	next ""
	next "www.github.com/WeCanNeitherConfirmNorDeny/pokemon-yinyang-testing-3"
	db "@"

VersionScreenText3:
	db   "Have fun!"
	next "  - Mateo, 2018@"
