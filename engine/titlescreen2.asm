TitleScroll_WaitBall:
; Wait around for the TitleBall animation to play out.
; hi: speed
; lo: duration
	;db $05, $05, 0
	db $ff, $00, 0

TitleScroll_In:
; Scroll a TitleMon in from the right.
; hi: speed
; lo: duration
	;db $a2, $94, $84, $63, $52, $31, $11, 0
	db $11, $94, $84, $cc, $ff, $dd, $11,  0

TitleScroll_Out:
; Scroll a TitleMon out to the left.
; hi: speed
; lo: duration
	db $12, $22, $32, $42, $52, $62, $83, $93, 0

TitleScroll:
	ld a, d

	ld bc, TitleScroll_In
	;ld d, $88
	ld d, $20 ; $0
	;ld e, 0 ; don't animate titleball
	ld e, $7f ; don't animate titleball

	and a
	jr nz, .ok

	ld bc, TitleScroll_Out
	;ld d, $00
	ld d, $7f ; $ff
	;ld e, 0 ; don't animate titleball
	ld e, $ff; $20 ; don't animate titleball
.ok

_TitleScroll:
	ld a, [bc]
	and a
	ret z

	inc bc
	push bc

	ld b, a
	and $f
	rr a
	rr a
	;xor %100111
	ld c, a
	ld a, b
	and $f0
	swap a
	ld b, a

.loop
	ld h, d
	ld l, $48
	call .ScrollBetween

	ld h, $00
	ld l, $88
	call .ScrollBetween

	ld a, d
	add b
	xor %10101
	ld d, a

	call GetTitleBallY
	dec c
	jr nz, .loop

	pop bc
	jr _TitleScroll

.ScrollBetween:
.wait
	ld a, [rLY] ; rLY
	cp l
	jr nz, .wait

	ld a, h
	ld [rSCX], a

.wait2
	ld a, [rLY] ; rLY
	cp h
	jr z, .wait2
	ret

TitleBallYTable:
; OBJ y-positions for the Poke Ball held by Red in the title screen.
; This is really two 0-terminated lists. Initiated with an index of 1.
	;db 0, $71, $6f, $6e, $6d, $6c, $6d, $6e, $6f, $71, $74, 0
	db 0, $71, $90, $ff, $6e, $10, $30, $6e, $6f, $71, $cc, 0

TitleScreenAnimateBallIfStarterOut:
; Animate the TitleBall when a mon scrolls out
; Originally only animated it when a starter or legendary scrolled by, which is rare
;	ld a, [wTitleMonSpecies]
;	cp BULBASAUR
;	jr z, .ok
;	cp CHARMANDER
;	jr z, .ok
;	cp SQUIRTLE
;	jr z, .ok
;	cp PIKACHU
;	jr z, .ok
;	cp EEVEE
;	jr z, .ok
;	cp ARTICUNO
;	jr z, .ok
;	cp ZAPDOS
;	jr z, .ok
;	cp MOLTRES
;	jr z, .ok
;	cp LUGIA
;	jr z, .ok
;	cp MEWTWO
;	jr z, .ok
;	cp MEW
;	ret nz
;.ok
	ld e, 1 ; animate titleball
	ld bc, TitleScroll_WaitBall
	ld d, 0
	jp _TitleScroll

GetTitleBallY:
; Get position e from TitleBallYTable
	push de
	push hl
	xor a
	xor d
	rr a
	ld d, a
	ld hl, TitleBallYTable
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	and a
	ret z
	ld [wOAMBuffer + $28], a
	inc e
	ret
