as yet unclassified
add: aCard onEffectingCardsTo: aPlayer 
	| cards |
	cards := cardsAffectingPlayers at: aPlayer.
	cards add: aCard.