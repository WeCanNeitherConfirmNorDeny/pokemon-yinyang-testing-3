db DEX_TAUROS ; pokedex id
db 75 ; base hp
db 100 ; base attack
db 95 ; base defense
db 110 ; base speed
db 70 ; base special
db MALE_ONLY         ; gender ratio Tauros
db NORMAL ; species type 1
db NORMAL ; species type 2
db 45 ; catch rate
db 211 ; base exp yield
INCBIN "pic/bmon/tauros.pic",0,1 ; 77, sprite dimensions
dw TaurosPicFront
dw TaurosPicBack
; move tutor compatibility flags
	m_tutor 0
	m_tutor 0
	m_tutor 0
	m_tutor 0
db 5 ; growth rate
; learnset
	tmlearn 1,5,6,7,8
	tmlearn 9,10,11,13,14,15,16
	tmlearn 22,24
	tmlearn 25,26,27,30,31,32
	tmlearn 34,36,40
	tmlearn 44,45
	tmlearn 53,54
db BANK(TaurosPicFront)
