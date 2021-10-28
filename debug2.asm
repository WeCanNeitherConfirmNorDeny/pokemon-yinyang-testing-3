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
	ld b,BICYCLE
	call GiveItem ; bicycle

	; hm's
	ld b, (HM_01 -1)
	:
	inc b
	call GiveItem
	ld a, b
	cp HM_05
	jr c, :-

	ret

