asserting
assertThePlayers: aPlayer deckHasThis: aCard 
	| cards |
	cards:= playersDecks at: aPlayer.
	cards indexOf: aCard ifAbsent: [ GameError signal: 'Player doesnt have this card' ].
	^true.