db DEX_ELECTRODE ; pokedex id
db 60 ; base hp
db 50 ; base attack
db 70 ; base defense
db 150 ; base speed
db 80 ; base special
db GENDERLESS         ;gender ratio  Electrode
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 60 ; catch rate
db 150 ; base exp yield
INCBIN "pic/bmon/electrode.pic",0,1 ; 55, sprite dimensions
dw ElectrodePicFront
dw ElectrodePicBack
; move tutor compatibility flags
	m_tutor 0
	m_tutor 0
	m_tutor 0
	m_tutor 0
db 0 ; growth rate
; learnset
	tmlearn 6
	tmlearn 9,15
	tmlearn 24
	tmlearn 25,31,32
	tmlearn 33,34,39,40
	tmlearn 44,45,47
	tmlearn 50
db BANK(ElectrodePicFront)
