action
assertIsTheTurnof: aPlayer
	aPlayer == (players at: playerIndex)
		ifFalse: [ Error signal: 'It is not your turn' ]