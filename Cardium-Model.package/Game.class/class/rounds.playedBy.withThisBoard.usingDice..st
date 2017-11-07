private-rounds
rounds: aRound playedBy: somePlayers withThisBoard: aBoard usingDice: aDice 
	aRound<=0 ifTrue: [ GameError signal: 'the number of rounds to win must be greater than 0' ].
	^ self new initializeRounds: aRound initializePlayers: somePlayers initializeBoard: aBoard initializeDice: aDice.