db DEX_ZUBAT ; pokedex id
db 40 ; base hp
db 45 ; base attack
db 35 ; base defense
db 55 ; base speed
db 40 ; base special
db SAME_BOTH_GENDERS ; gender ratio Zubat
db POISON ; species type 1
db FLYING ; species type 2
db 255 ; catch rate
db 54 ; base exp yield
INCBIN "pic/bmon/zubat.pic",0,1 ; 55, sprite dimensions
dw ZubatPicFront
dw ZubatPicBack
; move tutor compatibility flags
	m_tutor 0
	m_tutor 0
	m_tutor 0
	m_tutor 0
db 0 ; growth rate
; learnset
	tmlearn 3,4,6,8
	tmlearn 9,10
	tmlearn 21
	tmlearn 30,31,32
	tmlearn 33,34,39
	tmlearn 41,42,43,44
	tmlearn 52
db BANK(ZubatPicFront)
