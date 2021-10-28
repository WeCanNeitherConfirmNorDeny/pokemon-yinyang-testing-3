RedsHouse2FScript:
	call EnableAutoTextBoxDrawing
	ld hl,RedsHouse2FScriptPointers
	ld a,[wRedsHouse2CurScript]
	jp CallFunctionInTable

RedsHouse2FScriptPointers:
	dw RedsHouse2FScript0
	dw RedsHouse2FScript1

RedsHouse2FScript0:
	xor a
	ld [hJoyHeld],a
	ld a,PLAYER_DIR_UP
	ld [wPlayerMovingDirection],a
	ld a,1
	ld [wRedsHouse2CurScript],a
	ret

RedsHouse2FScript1:
	ret

RedsHouse2FTextPointers:
	dw RedsHouse2FGetNinetales

RedsHouse2FGetNinetales:
	TX_ASM
	lb bc, NINETALES, 50
	call GivePokemon
	jr nc, .noCarry
	ld a, HS_REDS_HOUSE_2F_NINETALES
	ld [wMissableObjectIndex], a
	predef HideObject
.noCarry
	jp TextScriptEnd

