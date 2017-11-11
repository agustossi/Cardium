adding
add: aCard to: aPlayer 
	| cards |
	cards := playersDecks at: aPlayer.
	cards add: aCard.