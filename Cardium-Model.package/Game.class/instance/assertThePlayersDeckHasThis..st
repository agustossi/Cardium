as yet unclassified
assertThePlayersDeckHasThis: aCard 
	| currentPlayer cards |
	currentPlayer := players at: playerIndex.
	cards:= playersDecks at: currentPlayer.
	cards indexOf: aCard ifAbsent: [ GameError signal: 'Player doesnt have this card' ].