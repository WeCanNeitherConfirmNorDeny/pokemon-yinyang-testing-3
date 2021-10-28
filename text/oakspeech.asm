_OakSpeechText1::
	text "Hello there!"
	line "Welcome to the"
	;cont "world of #mon!"
	cont "#mon Yin!"

	;para "My name is Oak!"
	;line "People call me"
	;cont "the #mon Prof!"
	prompt

_OakSpeechText2A::
	text "This world is"
	line "inhabited by"
	cont "creatures called"
	cont "#mon!@@"

_OakSpeechText2B::
	text $51,"People and #mon"
	line "live together by"

	para "supporting each"
	line "other."

	para "Some people play"
	line "with #mon,"
	cont "some battle with"
	cont "them."

	para "But we don't know"
	line "everything about"
	cont "#mon yet."

	para "There are still"
	line "many mysteries to"
	cont "solve."

	para "That's why I study"
	line "#mon daily."
	prompt

_IntroduceRivalText::
	text "This is my"
	line "grandson."
	
	para "He's been your"
	line "rival since you"
	cont "were younger."

	para "...Erm, what is"
	line "his name again?"
	prompt

_IntroduceRivalText2::
	text "...Erm, what is"
	line "his name again?"
	prompt

_OakSpeechText3::
	text "[PLAYER]!"

	para "Your very own"
	line "#mon legend is"
	cont "about to unfold!"

	para "A world of dreams"
	line "and adventures"
	cont "with #mon"
	cont "awaits...Let's go!"
	done

_IntroducePlayerText::
	;text "Now tell me, what"
	;line "is your name?"
	text "Now, what was your"
	line "name again?"
	prompt

_BoyGirlText::
	text "Play as a boy, or"
	line "as a girl?"
	done
	
_ShouldMonsObeyText::
	text "Do you like"
	line "drugs?"
	done

_YourNameIsText2::
	text "Is it [PLAYER]?"
	done

_HisNameIsText2::
	text "Was it [RIVAL]?"
	done
