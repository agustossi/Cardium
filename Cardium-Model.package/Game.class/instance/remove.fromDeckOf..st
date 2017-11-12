as yet unclassified
remove: aCard fromDeckOf: aPlayer 
	| cards |
	cards:=playersDecks at: aPlayer.
	cards remove: aCard.