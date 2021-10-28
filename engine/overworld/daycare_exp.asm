IncrementDayCareMonExp:
	ld a, [wDayCareInUse]
	and a
	ret z
	ld hl, wDayCareMonExp + 2 ; LSB of exp
	inc [hl]
	ret nz ; ret if we did not produce zero
	dec hl ; point to next digit
	inc [hl]
	ret nz ; ret if we did not produce zero
	dec hl ; point to next digit
	inc [hl]
	ld a, [hl]
	cp DAYCARE_EXP_CEILING ; check a against ceiling
	ret c ; ret if not above
	ld a, DAYCARE_EXP_CEILING
	ld [hl], a ; else, trim at limit
	ret
