tests
testWormholeTileEffectAppliedToThisSetOfPlayersIsWorking
	
	| aWormholeTile game seba board dice dice1 totalPlayers |
	
	seba := Player named: 'sebastian'.
	board := Board ofSize: 10.
	dice1 := Dice faces: 6.
	dice1 setValue: 1.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	game := Game	 rounds: 1 playedBy: totalPlayers withThisBoard: board usingDice: dice.
	
	aWormholeTile := Wormhole new.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tile equals:0.
	aWormholeTile appliesEffectOn: game allPlayersPositions playing: seba.
	(game positionOf: seba) updateRoundsOnABoardOf: 10.
	self assert: (game positionOf: seba) rounds equals: -1.
	self assert: (game positionOf: seba) tile equals:-4.