db DEX_PIKACHU ; pokedex id
db 35 ; base hp
db 55 ; base attack
db 40 ; base defense
db 90 ; base speed
db 50 ; base special
db SAME_BOTH_GENDERS ; gender ratio Pikachu
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 190 ; catch rate
db 82 ; base exp yield
INCBIN "pic/bmon/pikachu.pic",0,1 ; 55, sprite dimensions
dw PikachuPicFront
dw PikachuPicBack
; move tutor compatibility flags
	m_tutor 4
	m_tutor 9
	m_tutor 0
	m_tutor 0
db 0 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,16
	tmlearn 17,18,19,24
	tmlearn 25,31,32
	tmlearn 33,34,39,40
	tmlearn 44,45
	tmlearn 50,54
db BANK(PikachuPicFront)
