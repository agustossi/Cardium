asserting
assertThePlayer: aPlayer effectingDeckHasThis: aCard
	| cards |
	cards := cardsAffectingPlayers at: aPlayer.
	cards
		indexOf: aCard
		ifAbsent: [ GameError signal: 'Player isnt being affected by this card' ].
	^ true