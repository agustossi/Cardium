asserting
assertThePlayer: aPlayer effectingDeckHasThis: aCard 
	| cards |
	cards:= cardsAffectingPlayers at: aPlayer.
	Transcript show: cards.
	cards indexOf: aCard ifAbsent: [ GameError signal: 'Player isnt being affected by this card' ].
	^ true.