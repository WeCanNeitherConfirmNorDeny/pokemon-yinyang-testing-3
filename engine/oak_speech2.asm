ReChoosePlayerName:
	ld hl,IntroducePlayerText
	call PrintText
ChoosePlayerName:
	call OakSpeechSlidePicRight
	ld a, [wPlayerGender]   ; Added gender check
	and a        ; Added gender check
	jr nz, .AreGirl ; Skip to girl names if you are a girl instead
	ld de, DefaultNamesPlayer
	call DisplayIntroNameTextBox
	ld a, [wCurrentMenuItem]
	and a
	jr z, .customName
	ld hl, DefaultNamesPlayerList
	call GetDefaultName
	ld de, wPlayerName
	call OakSpeechSlidePicLeft
	jr .done
.AreGirl ; Copy of the boy naming routine, just with girl's names
	ld de, DefaultNamesGirl
	call DisplayIntroNameTextBox
	ld a, [wCurrentMenuItem] ; wCurrentMenuItem
	and a
	jr z, .customName
	ld hl, DefaultNamesGirlList
	call GetDefaultName
	ld de, wPlayerName
	call OakSpeechSlidePicLeft
	jr .done ; End of new Girl Names routine
.customName
	ld hl, wPlayerName
	xor a ; NAME_PLAYER_SCREEN
	ld [wNamingScreenType], a
	call DisplayNamingScreen
	ld a, [wcf4b]
	cp "@"
	jr nz, .notBlankName
	ld hl, RedDefaultName
	ld a, [wPlayerGender]
	and a
	jr z, .okGo
	ld hl, LeafDefaultName
.okGo
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
.notBlankName
	call ClearScreen
	call Delay3
	ld de, RedPicFront
	ld b, BANK(RedPicFront)
	ld a, [wPlayerGender] ; Added gender check
	and a      ; Added gender check
	jr z, .AreBoy3
	ld de, LeafPicFront
	ld b, BANK(LeafPicFront)
.AreBoy3
	call IntroDisplayPicCenteredOrUpperRight
.done
	ld hl, YourNameIsText2
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, ReChoosePlayerName
	ld hl, YourNameIsText
	jp PrintText

YourNameIsText:
	TX_FAR _YourNameIsText
	db "@"

YourNameIsText2:
	TX_FAR _YourNameIsText2
	db "@"

ReChooseRivalName:
	ld hl,IntroduceRivalText2
	call PrintText
ChooseRivalName:
	call OakSpeechSlidePicRight
	ld de, DefaultNamesRival
	call DisplayIntroNameTextBox
	ld a, [wCurrentMenuItem]
	and a
	jr z, .customName
	ld hl, DefaultNamesRivalList
	call GetDefaultName
	ld de, wRivalName
	call OakSpeechSlidePicLeft
	jr .done
.customName
	ld hl, wRivalName
	ld a, NAME_RIVAL_SCREEN
	ld [wNamingScreenType], a
	call DisplayNamingScreen
	ld a, [wcf4b]
	cp "@"
	jr nz, .notBlankName
	ld hl, RivalDefaultName
	ld de, wRivalName
	ld bc, NAME_LENGTH
	call CopyData
.notBlankName
	call ClearScreen
	call Delay3
	ld de, Rival1Pic
	ld b, $13
	call IntroDisplayPicCenteredOrUpperRight
.done
	ld hl, HisNameIsText2
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, ReChooseRivalName
	ld hl, HisNameIsText
	jp PrintText

IntroduceRivalText2:
	TX_FAR _IntroduceRivalText2
	db "@"

HisNameIsText:
	TX_FAR _HisNameIsText
	db "@"

HisNameIsText2:
	TX_FAR _HisNameIsText2
	db "@"

OakSpeechSlidePicLeft:
	push de
	coord hl, 0, 0
	lb bc, 12, 11
	call ClearScreenArea ; clear the name list text box
	;ld c, 10
	ld c, 7
	call DelayFrames
	pop de
	ld hl, wcd6d
	ld bc, NAME_LENGTH
	call CopyData
	call Delay3
	coord hl, 12, 4
	lb de, 6, 6 * SCREEN_WIDTH + 5
	ld a, $ff
	jr OakSpeechSlidePicCommon

OakSpeechSlidePicRight:
	coord hl, 5, 4
	lb de, 6, 6 * SCREEN_WIDTH + 5
	xor a

OakSpeechSlidePicCommon:
	push hl
	push de
	push bc
	ld [hSlideDirection], a
	ld a, d
	ld [hSlideAmount], a
	ld a, e
	ld [hSlidingRegionSize], a
	ld c, a
	ld a, [hSlideDirection]
	and a
	jr nz, .next
; If sliding right, point hl to the end of the pic's tiles.
	ld d, 0
	add hl, de
.next
	ld d, h
	ld e, l
.loop
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, [hSlideDirection]
	and a
	jr nz, .slideLeft
; sliding right
	ld a, [hli]
	ld [hld], a
	dec hl
	jr .next2
.slideLeft
	ld a, [hld]
	ld [hli], a
	inc hl
.next2
	dec c
	jr nz, .loop
	ld a, [hSlideDirection]
	and a
	jr z, .next3
; If sliding left, we need to zero the last tile in the pic (there is no need
; to take a corresponding action when sliding right because hl initially points
; to a 0 tile in that case).
	xor a
	dec hl
	ld [hl], a
.next3
	ld a, 1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	ld a, [hSlidingRegionSize]
	ld c, a
	ld h, d
	ld l, e
	ld a, [hSlideDirection]
	and a
	jr nz, .slideLeft2
	inc hl
	jr .next4
.slideLeft2
	dec hl
.next4
	ld d, h
	ld e, l
	ld a, [hSlideAmount]
	dec a
	ld [hSlideAmount], a
	jr nz, .loop
	pop bc
	pop de
	pop hl
	ret

DisplayIntroNameTextBox:
	push de
	coord hl, 0, 0 ; pos x,y of box
	;ld b, $a
	;ld c, $9
	ld b, ($a + (-2))
	ld c, ($9 + 2) ; len x,y of box
	;call TextBoxBorder
	call TextBoxBorderless
	;coord hl, 3, 0
	coord hl, 1, 0
	ld de, .namestring
	call PlaceString ; "Your name?"
	pop de
	coord hl, 3, 3
	call PlaceString ; names list
	call UpdateSprites
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, 1
	ld [wTopMenuItemX], a
	ld [wMenuWatchedKeys], a ; A_BUTTON
	ld a, 3
	ld [wTopMenuItemY], a
	;ld a, 3
	ld [wMaxMenuItem], a
	jp HandleMenuInput

.namestring
	db "Your name?@"

DefaultNamesPlayer:
	db   "New..."
IF DEF(_HARD)
	next "Yang"
	next "Gary"
	next "Suzuki"
ELSE
	next "Yin"
	next "Ash"
	next "Satoshi"
ENDC
	db   "@"

DefaultNamesGirl:
	db   "New..."
	next "Leaf"
	next "Ashley"
	next "Midori"
	db   "@"

DefaultNamesRival:
	db   "New..."
IF DEF(_HARD)
	next "Yin"
	next "Ash"
	next "Satoshi"
ELSE
	next "Yang"
	next "Gary"
	next "Suzuki"
ENDC
	db   "@"

GetDefaultName:
; a = name index
; hl = name list
	ld b, a
	ld c, 0
.loop
	ld d, h
	ld e, l
.innerLoop
	ld a, [hli]
	cp "@"
	jr nz, .innerLoop
	ld a, b
	cp c
	jr z, .foundName
	inc c
	jr .loop
.foundName
	ld h, d
	ld l, e
	ld de, wcd6d
	ld bc, $14
	jp CopyData

DefaultNamesPlayerList:
	db "New...@"
RedDefaultName:
IF DEF(_HARD)
	db "Yang@"
	db "Gary@"
	db "Suzuki@"
ELSE
	db "Yin@"
	db "Ash@"
	db "Satoshi@"
ENDC

DefaultNamesRivalList:
	db "New...@"
RivalDefaultName:
IF DEF(_HARD)
	db "Yin@"
	db "Ash@"
	db "Satoshi@"
ELSE
	db "Yang@"
	db "Gary@"
	db "Suzuki@"
ENDC

DefaultNamesGirlList:
	db "New...@"
LeafDefaultName:
	db "Leaf@"
	db "Ashley@"
	db "Midori@"

TextTerminator_6b20:
	db "@"
