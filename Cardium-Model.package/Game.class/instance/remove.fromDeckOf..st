removing
remove: aCard fromDeckOf: aPlayer 
	| cards |
	cards:=playersDecks at: aPlayer.
	cards remove: aCard.