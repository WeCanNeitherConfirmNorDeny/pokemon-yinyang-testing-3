TogeticBaseStats:
db DEX_TOGETIC ; pokedex id
db 55 ; base hp
db 40 ; base attack
db 85 ; base defense
db 40 ; base speed
db 105 ; base special
db MALE_88_PERCENT   ; gender ratio Togetic
db FAIRY ; species type 1
db FLYING ; species type 2
db 75 ; catch rate
db 114 ; base exp yield
INCBIN "pic/bmon/togetic.pic",0,1 ; 55, sprite dimensions
dw TogeticPicFront
dw TogeticPicBack
; move tutor compatibility flags
	m_tutor 0
	m_tutor 0
	m_tutor 0
	m_tutor 0
db 3 ; growth rate
; learnset
	tmlearn 4,5,6,8
	tmlearn 9,10,11,15
	tmlearn 18,19,22,23
	tmlearn 29,30,31,32
	tmlearn 34,37,38,39,40
	tmlearn 41,42,44,45,46
	tmlearn 49,50,52
db BANK(TogeticPicFront)
