adding
pickUpFromMazeAndAsignTo: aPlayer 
	| cards aCard |
	cards := playersDecks at: aPlayer.
	aCard := deck removeAt: (deck size).
	cards add: aCard.