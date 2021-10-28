db DEX_VULPIX ; pokedex id
db 38 ; base hp
db 41 ; base attack
db 40 ; base defense
db 111 ; base speed
db 99 ; base special
db FEMALE_75_PERCENT ; gender ratio Vulpix
db FIRE ; species type 1
db PSYCHIC ; species type 2
db 100 ; catch rate
db 85 ; base exp yield
INCBIN "pic/bmon/vulpix.pic",0,1 ; 66, sprite dimensions
dw VulpixPicFront
dw VulpixPicBack
; move tutor compatibility flags
	m_tutor 8
	m_tutor 0
	m_tutor 0
	m_tutor 0
db 0 ; growth rate
; learnset
	tmlearn TM_MEGA_KICK, TM_TOXIC, TM_BODY_SLAM
	tmlearn TM_TAKE_DOWN, TM_DOUBLE_EDGE, TM_IRON_TAIL
	tmlearn TM_SOLARBEAM, TM_DRAGONBREATH, TM_THUNDERBOLT, TM_THUNDER
	tmlearn TM_DIG, TM_SHADOW_BALL, TM_MIMIC, TM_DOUBLE_TEAM
	tmlearn TM_REFLECT, TM_HEADBUTT, TM_FLAMETHROWER, TM_FIRE_BLAST, TM_SWIFT, TM_SKULL_BASH
	tmlearn TM_DARK_PULSE, TM_REST
	tmlearn HM_FLASH, HM_FLY
db BANK(VulpixPicFront)
