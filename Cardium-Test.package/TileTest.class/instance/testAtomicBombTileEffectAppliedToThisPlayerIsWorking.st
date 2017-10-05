tests
testAtomicBombTileEffectAppliedToThisPlayerIsWorking

	| anAtomicBombTile game seba board dice dice1 totalPlayers agus |
	
	seba := Player named: 'sebastian'.
	agus := Player named: 'Agustina'.
	board := Board ofSize: 10.
	dice1 := Dice faces: 6.
	dice1 setValue: 1.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	game := Game	 rounds: 1 playedBy: totalPlayers withThisBoard: board usingDice: dice.
	anAtomicBombTile := AtomicBomb new.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tile equals:0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tile equals:0.
	game nextTurn: seba.
	game nextTurn: agus.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tile equals:1.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tile equals:2.
	anAtomicBombTile appliesEffectOn: game allPlayersPositions playing: seba.
	
	(game positionOf: seba) updateRoundsOnABoardOf: 10.
	(game positionOf: agus) updateRoundsOnABoardOf: 10.
	
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tile equals:0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tile equals:0.