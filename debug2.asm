;;;;;;;;;;;;;;;
; debugging

;;;;;;;;;;;;;;;
;
; start_items
; gives a few items to make things faster
; INPUT -
;	c = quantity
start_items:
	and c
	jr nz, :+
		ld c, $ff
	:
	ld b,MIRROR
	call GiveItem ; mirror
	ld b,SNOWGLOBE
	call GiveItem ; snowglobe
	ld b,OCEAN_BERRY
	call GiveItem ; ocean berry
	ld b,GOLD_BERRY
	call GiveItem ; gold berry
	ld b,$28
	call GiveItem ; rare candy
	ld b,$01
	call GiveItem ; masterball
	ld b,$10
	call GiveItem ; full restore
	ld b,MAX_ELIXER
	call GiveItem ; max elixir
	ld b,MAX_REVIVE
	call GiveItem ; max revive
	ld b,MAX_REPEL
	call GiveItem ; max repel

	ld b, (ORAN_BERRY -1)
	:
	inc b
	call GiveItem
	ld a, b
	cp ACAI_BERRY
	jr c, :-

	ld c, 1
	ld b, (HM_01 -1)
	:
	inc b
	call GiveItem
	ld a, b
	cp HM_05
	jr c, :-

	ld b,SURFBOARD
	call GiveItem ; surfboard
	;ld b,TEST_ITEM
	;call GiveItem ; test item
.die
	ret

;;;;;;;;;;;;;;;
;
; skip intro
skip_intro:
	xor a
	and a
	jr nz, :+
	ld [wPlayerGender], a ; male
	ld hl, StarterOT_Ninten ; name -> red=yin and blue=yang
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData ; write player name
	jr :++
:
	ld [wPlayerGender], a ; female
	ld hl, StarterOT_Leaf ; name -> leaf
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData ; write player name
:
	ld hl, wExtraFlags
	set 2,[hl] ; monsters will obey
	call GBFadeOutToBlack
	call GetRivalPalID ; HAX
	ld hl, StarterOT_Sony ; rival -> red=yin and blue=yang
	ld de, wRivalName
	ld bc, NAME_LENGTH
	call CopyData ; write rival name
.die
	ret

IF DEF(_HARD)
StarterOT_Ninten:
	db "Yang@"
StarterOT_Sony:
	db "Yin@"
ELSE
StarterOT_Ninten:
	db "Yin@"
StarterOT_Sony:
	db "Yang@"
ENDC
StarterOT_Leaf:
	db "Leaf@"
