action
assertIsTheTurnof: aPlayer
	aPlayer name asSymbol == (players at: playerIndex) name asSymbol
		ifFalse: [ Error signal: 'It is not your turn' ]