DisplayStartMenu::
	ld a,BANK(StartMenu_Pokedex)
	ld [H_LOADEDROMBANK],a
	ld [MBC1RomBank],a
	ld a,[wWalkBikeSurfState] ; walking/biking/surfing
	ld [wWalkBikeSurfStateCopy],a
	ld a, SFX_START_MENU
	call PlaySound

RedisplayStartMenu::
	callba DrawStartMenu
	callba PrintSafariZoneSteps ; print Safari Zone info, if in Safari Zone
	call UpdateSprites
.loop
	call HandleMenuInput
	ld b,a
.checkIfUpPressed
	bit BIT_D_UP,a ; was Up pressed?
	jr z,.checkIfDownPressed
	ld a,[wCurrentMenuItem] ; menu selection
	and a
	jr nz,.loop
	ld a,[wLastMenuItem]
	and a
	jr nz,.loop
; if the player pressed tried to go past the top item, wrap to the end
; account for having pokedex
.wrapTopPokedex
	CheckEvent EVENT_GOT_POKEDEX
	;ld a,6 ; there are 7 menu items with the pokedex, so the max index is 6
	ld a,(START_MENU_ITEMS_ALL -1) ; 0 based index
	;jr nz,.wrapMenuItemId
	jr nz,.wrapTopPokemon
	dec a ; menu items without the pokedex
; account for having pokemon
.wrapTopPokemon
	ld [wUnused_BYTE], a
	ld a,[wPartyCount]
	or a
	ld a, [wUnused_BYTE]
	jr nz,.wrapMenuItemId
	dec a
.wrapMenuItemId
	ld [wCurrentMenuItem],a
	call EraseMenuCursor
	jr .loop
.checkIfDownPressed
	;bit 7,a
	bit BIT_D_DOWN,a
	jr z,.buttonPressed
; if the player tried to go past the last item, wrap to the top
.wrapDownPokedex
	CheckEvent EVENT_GOT_POKEDEX
	;ld a,[wCurrentMenuItem]
	ld c,START_MENU_ITEMS_ALL ; there are 7 menu items with the pokedex
	;jr nz,.checkIfPastBottom
	jr nz,.wrapDownPokemon
	dec c ; there are only 6 menu items without the pokedex
.wrapDownPokemon
	ld a,[wPartyCount]
	or a
	ld a,[wCurrentMenuItem]
	jr nz,.checkIfPastBottom
	dec c
.checkIfPastBottom
	cp c
	jr nz,.loop
; the player went past the bottom, so wrap to the top
	xor a
	ld [wCurrentMenuItem],a
	call EraseMenuCursor
	jr .loop
.buttonPressed ; A, B, or Start button pressed
	call PlaceUnfilledArrowMenuCursor
	ld a,[wCurrentMenuItem]
	ld [wBattleAndStartSavedMenuItem],a ; save current menu selection
	ld a,b
	;and a,%00001010 ; was the Start button or B button pressed?
	and a,(START + B_BUTTON) ; was the Start button or B button pressed?
	jp nz,CloseStartMenu
	call SaveScreenTilesToBuffer2 ; copy background from wTileMap to wTileMapBackup2
.menuAccountPokedex
	CheckEvent EVENT_GOT_POKEDEX
	ld a,[wCurrentMenuItem]
	;jr nz,.displayMenuItem
	jr nz,.menuAccountPokemon
	inc a ; adjust position to account for missing pokedex menu item
	ld [wCurrentMenuItem],a
.menuAccountPokemon
	ld a,[wPartyCount]
	or a
	ld a,[wCurrentMenuItem]
	jr nz,.displayMenuItem
	inc a
.displayMenuItem
	cp a,0
	jp z,StartMenu_Pokedex
	cp a,1
	jp z,StartMenu_Pokemon
	cp a,2
	jp z,StartMenu_Item
	cp a,3
	jp z,StartMenu_TrainerInfo
	cp a,4
	jp z,StartMenu_SaveReset
	cp a,5
	jp z,StartMenu_Option

; EXIT falls through to here
CloseStartMenu::
	call Joypad
	ld a,[hJoyPressed]
	bit BIT_A_BUTTON,a ; was A button newly pressed?
	jr nz,CloseStartMenu
	call LoadTextBoxTilePatterns
	jp CloseTextDisplay

