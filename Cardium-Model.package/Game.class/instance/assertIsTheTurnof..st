asserting
assertIsTheTurnof: aPlayer
	aPlayer == (players at: playerIndex)
		ifFalse: [ GameError signal: 'It is not your turn' ]