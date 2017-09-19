private-rounds
rounds: aRound createdBy: aCreator withThisBoard: aBoard usingDice: aDice 
	aRound<=0 ifTrue: [ Error signal: 'the number of rounds to win must be greater than 0' ].
	^ self new initializeRounds: aRound initializeCreator: aCreator initializeBoard: aBoard initializeDice: aDice.