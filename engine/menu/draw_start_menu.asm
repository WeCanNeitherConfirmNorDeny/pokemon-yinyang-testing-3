; function that displays the start menu
DrawStartMenu:
	;CheckEvent EVENT_GOT_POKEDEX
; menu with pokedex
	;coord hl, 10, 0
	;ld b,$0e
	;ld c,$08
	;coord hl, 8, 0
	;ld b,$0f
	;ld c,$0a
	;jr nz,.drawTextBoxBorder
; shorter menu if the player doesn't have the pokedex
	;coord hl, 10, 0
	;ld b,$0c
	;ld c,$08
	;coord hl, START_MENU_X, START_MENU_Y	; coordinates
	;ld b,START_MENU_HEIGHT 	; y length
	;ld c,START_MENU_WIDTH 	; x length
	box_coords START_MENU
.drawTextBoxBorder
	;call TextBoxBorder
	call TextBoxBorderless
	ld a,D_DOWN | D_UP | START | B_BUTTON | A_BUTTON
	ld [wMenuWatchedKeys],a
	ld a,$02
	ld [wTopMenuItemY],a ; Y position of first menu choice
	ld a,$0b - 2
	ld [wTopMenuItemX],a ; X position of first menu choice
	ld a,[wBattleAndStartSavedMenuItem] ; remembered menu selection from last time
	ld [wCurrentMenuItem],a
	ld [wLastMenuItem],a
	xor a
	ld [wMenuWatchMovingOutOfBounds],a
	ld hl,wd730
	set 6,[hl] ; no pauses between printing each letter
	coord hl, 12, 2
.haspokedex
	CheckEvent EVENT_GOT_POKEDEX
; case for not having pokedex
	;ld a,$06
	ld a,START_MENU_ITEMS_NO_POKEDEX
	ld [wUnused_BYTE], a
	;jr z,.storeMenuItemCount
	jr z,.haspokemon
; case for having pokedex
	ld de,StartMenuPokedexText
	call PrintStartMenuItem
	;ld a,$07
	ld a,START_MENU_ITEMS_ALL
	ld [wUnused_BYTE], a
.haspokemon
	ld a,[wPartyCount] ; check party count
	or a
	jr nz,.haspokemon_true
; case for not having pokemon
	ld a, [wUnused_BYTE]
	dec a
	jr .storeMenuItemCount
; got starter
.haspokemon_true
	ld de,StartMenuPokemonText
	call PrintStartMenuItem
	ld a, [wUnused_BYTE]
.storeMenuItemCount
	ld [wMaxMenuItem],a ; number of menu items
	ld de,StartMenuItemText
	call PrintStartMenuItem
	ld de,wPlayerName ; player's name
	call PrintStartMenuItem
	ld a,[wd72e]
	bit 6,a ; is the player using the link feature?
; case for not using link feature
	ld de,StartMenuSaveText
	jr z,.printSaveOrResetText
; case for using link feature
	ld de,StartMenuResetText
.printSaveOrResetText
	call PrintStartMenuItem
	ld de,StartMenuOptionText
	call PrintStartMenuItem
	ld de,StartMenuExitText
	call PlaceString
	ld hl,wd730
	res 6,[hl] ; turn pauses between printing letters back on
	ret

StartMenuPokedexText:
	db "Pokédex@"

StartMenuPokemonText:
	db "Pokémon@"

StartMenuItemText:
	db "Pack@"

StartMenuSaveText:
	db "Save@"

StartMenuResetText:
	db "Reset@"

StartMenuExitText:
	db "Quit@"

StartMenuOptionText:
	db "Options@"

PrintStartMenuItem:
	push hl
	call PlaceString
	pop hl
	ld de,SCREEN_WIDTH * 2
	add hl,de
	ret
