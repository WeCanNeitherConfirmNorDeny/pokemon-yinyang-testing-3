BluesHouseScript:
	call EnableAutoTextBoxDrawing
	ld hl, BluesHouseScriptPointers
	ld a, [wBluesHouseCurScript]
	jp CallFunctionInTable

BluesHouseScriptPointers:
	dw BluesHouseScript0
	dw BluesHouseScript1

BluesHouseScript0:
	SetEvent EVENT_ENTERED_BLUES_HOUSE

	; trigger the next script
	ld a, 1
	ld [wBluesHouseCurScript], a
	ret

BluesHouseScript1:
	ret

BluesHouseTextPointers:
	dw BluesHouseText1
	dw BluesHouseText2
	dw BluesHouseText3
	dw BluesHouseText4
	dw BluesHouseText5
	dw BluesHouseText6
	dw BluesHouseText7

BluesHouseText1:
	TX_ASM
	CheckEvent EVENT_GOT_TOWN_MAP
	jr nz, .GotMap
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .GiveMap
	ld hl, DaisyInitialText
	call PrintText
	jr .done

.GiveMap
	ld hl, DaisyOfferMapText
	call PrintText
	lb bc, TOWN_MAP, 1
	call GiveItem
	jr nc, .BagFull
	ld a, HS_TOWN_MAP
	ld [wMissableObjectIndex], a
	predef HideObject ; hide table map object
	ld hl, GotMapText
	call PrintText
	SetEvent EVENT_GOT_TOWN_MAP
	jr .done

.GotMap
	ld hl, DaisyUseMapText
	call PrintText
	jr .done

.BagFull
	ld hl, DaisyBagFullText
	call PrintText
.done
	jp TextScriptEnd

DaisyInitialText:
	TX_FAR _DaisyInitialText
	db "@"

DaisyOfferMapText:
	TX_FAR _DaisyOfferMapText
	db "@"

GotMapText:
	TX_FAR _GotMapText
	TX_SFX_KEY_ITEM
	db "@"

DaisyBagFullText:
	TX_FAR _DaisyBagFullText
	db "@"

DaisyUseMapText:
	TX_FAR _DaisyUseMapText
	db "@"

BluesHouseText2: ; Daisy, walking around
	TX_FAR _BluesHouseText2
	db "@"

BluesHouseText3: ; map on table
	TX_FAR _BluesHouseText3
	db "@"

BluesHouseText4:
	TX_FAR _StoveText
	db "@"
	
BluesHouseText5:
	TX_FAR _SinkText
	db "@"
	
BluesHouseText6:
	TX_FAR _FridgeText
	db "@"
	
BluesHouseText7:
	TX_ASM
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ld hl, TVWrongSideText2
	jr nz, .done ; if player is not facing up
	ld hl, BluesTVText
.done
	call PrintText
	jp TextScriptEnd

BluesTVText:
	TX_FAR _BluesTVText
	db "@"

TVWrongSideText2:
	TX_FAR _TVWrongSideText
	db "@"
