LoadMonData_:
; Load monster [wWhichPokemon] from list [wMonDataLocation]:
;  0: partymon
;  1: enemymon
;  2: boxmon
;  3: daycaremon
; Return monster id at wcf91 and its data at wLoadedMon.
; Also load base stats at wMonHeader for convenience.
	ld a, [wDayCareMonSpecies]
	ld [wcf91], a
	ld a, [wMonDataLocation]
	cp DAYCARE_DATA
	jr z, .GetMonHeader

	ld a, [wWhichPokemon]
	ld e, a
	callab GetMonSpecies

.GetMonHeader
	ld a, [wcf91]
	ld [wd0b5], a ; input for GetMonHeader
	call GetMonHeader

	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wMonDataLocation]
	cp ENEMY_PARTY_DATA
	jr c, .getMonEntry ; if player party data

	ld hl, wEnemyMons
	jr z, .getMonEntry ; if enemy party data

	cp BOX_DATA
	ld hl, wBoxMons
	ld bc, wBoxMon2 - wBoxMon1
	jr z, .getMonEntry ; if box data

	ld hl, wDayCareMon ; else its daycare data
	jr .copyMonData

.getMonEntry
	ld a, [wWhichPokemon]
	call AddNTimes

.copyMonData
	ld de, wLoadedMon
	ld bc, wPartyMon2 - wPartyMon1
	jp CopyData

