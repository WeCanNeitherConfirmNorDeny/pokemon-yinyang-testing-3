db DEX_NINETALES ; pokedex id
db 73 ; base hp
db 76 ; base attack
db 75 ; base defense
db $ff ; base speed
db 200 ; base special
db FEMALE_75_PERCENT ; gender ratio Ninetales
db FIRE ; species type 1
db PSYCHIC ; species type 2
db 45 ; catch rate
db 198 ; base exp yield
INCBIN "pic/bmon/ninetales.pic",0,1 ; 77, sprite dimensions
dw NinetalesPicFront
dw NinetalesPicBack
; move tutor compatibility flags
	m_tutor 8
	m_tutor 0
	m_tutor 0
	m_tutor 0
db 0 ; growth rate
; learnset
	tmlearn TM_MEGA_KICK, TM_TOXIC, TM_BODY_SLAM
	tmlearn TM_TAKE_DOWN, TM_DOUBLE_EDGE, TM_HYPER_BEAM, TM_IRON_TAIL
	tmlearn TM_SOLARBEAM, TM_DRAGONBREATH, TM_THUNDERBOLT, TM_THUNDER
	tmlearn TM_DIG, TM_PSYCHIC_M, TM_SHADOW_BALL, TM_MIMIC, TM_DOUBLE_TEAM
	tmlearn TM_REFLECT, TM_HEADBUTT, TM_FLAMETHROWER, TM_FIRE_BLAST, TM_SWIFT, TM_SKULL_BASH
	tmlearn TM_DARK_PULSE, TM_REST
	tmlearn HM_FLASH, HM_FLY
db BANK(NinetalesPicFront)
