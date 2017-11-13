removing
remove: aCard fromAffectingDeckOf: aPlayer 
	| cards |
	cards:=cardsAffectingPlayers at: aPlayer.
	cards remove: aCard.