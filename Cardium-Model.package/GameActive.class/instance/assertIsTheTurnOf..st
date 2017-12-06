asserting
assertIsTheTurnOf: aPlayer 
	aPlayer ~=currentPlayer ifTrue:[GameError signal: 'It is not your turn'].