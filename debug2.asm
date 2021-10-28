;;;;;;;;;;;;;;;
; debugging

;;;;;;;;;;;;;;;
;
; start_items
; gives a few items to make things faster
;
start_items:
; items you want 99 of
	ld c, 99
	ld b,MIRROR
	call GiveItem ; mirror
	ld b,SNOWGLOBE
	call GiveItem ; snowglobe
	ld b,RARE_CANDY
	call GiveItem ; rare candy
	ld b,MASTER_BALL
	call GiveItem ; masterball
	ld b,FULL_RESTORE
	call GiveItem ; full restore
	ld b,MAX_ELIXER
	call GiveItem ; max elixir
	ld b,MAX_REVIVE
	call GiveItem ; max revive
	ld b,MAX_REPEL
	call GiveItem ; max repel
	ld b,FULL_HEAL
	call GiveItem ; full heal
	ld b,MAX_POTION
	call GiveItem ; max potion

	; berries
	ld b, (MOUNTAIN_BERRY +1)
	:
	dec b
	call GiveItem
	ld a, b
	cp ORAN_BERRY
	jr nz, :-

; items you only need 1 of
	ld c, 1
	ld b,SURFBOARD
	call GiveItem ; surfboard
	ld b,TOWN_MAP
	call GiveItem ; town map

	; hm's
	ld b, (HM_01 -1)
	:
	inc b
	call GiveItem
	ld a, b
	cp HM_05
	jr c, :-

	ret

;;;;;;;;;;;;;;;
;
; skip intro
skip_intro:
	xor a
	and a
	jr nz, .noz
	ld [wPlayerGender], a ; male
	ld hl, StarterOT_Ninten ; name -> red=yin and blue=yang
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData ; write player name
	jr :+
.noz
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
