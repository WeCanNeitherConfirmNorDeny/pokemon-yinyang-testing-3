db DEX_WEEDLE ; pokedex id
db 40 ; base hp
db 35 ; base attack
db 30 ; base defense
db 50 ; base speed
db 20 ; base special
db SAME_BOTH_GENDERS ; gender ratio Weedle
db BUG ; species type 1
db POISON ; species type 2
db 255 ; catch rate
db 52 ; base exp yield
INCBIN "pic/bmon/weedle.pic",0,1 ; 55, sprite dimensions
dw WeedlePicFront
dw WeedlePicBack
; move tutor compatibility flags
	m_tutor 0
	m_tutor 0
	m_tutor 0
	m_tutor 0
db 0 ; growth rate
; learnset
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
db BANK(WeedlePicFront)
