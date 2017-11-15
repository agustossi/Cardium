removing
removeLastDecksCardOf: aPlayer 
	| cards |
	cards:=playersDecks at: aPlayer.
	cards removeAt: (cards size).