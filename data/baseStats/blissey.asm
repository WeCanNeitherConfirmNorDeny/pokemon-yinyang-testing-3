BlisseyBaseStats:
db DEX_BLISSEY ; pokedex id
db 255 ; base hp
db 10 ; base attack
db 10 ; base defense
db 55 ; base speed
db 135 ; base special
db FEMALE_ONLY       ; gender ratio Blissey
db NORMAL ; species type 1
db NORMAL ; species type 2
db 30 ; catch rate
db 255 ; base exp yield
INCBIN "pic/bmon/blissey.pic",0,1 ; 66, sprite dimensions
dw BlisseyPicFront
dw BlisseyPicBack
; move tutor compatibility flags
	m_tutor 0
	m_tutor 9,10,11
	m_tutor 0
	m_tutor 0
db 4 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,13,14,15,16
	tmlearn 17,18,19,22,24
	tmlearn 25,29,30,31,32
	tmlearn 33,34,36,37,38,40
	tmlearn 42,44,45,46,48
	tmlearn 49,50,54
db BANK(BlisseyPicFront)
