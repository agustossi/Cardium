tests
testPlayingUntilWinningWithTwoDice
	| game seba board dice dice1 dice2 agus totalPlayers |
	seba := Player named: 'sebastian'.
	agus := Player named: 'agustina'.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	board := Board ofSize: 20 withThisGenerator: TileRandomGeneratorNew.
	dice1 := Dice faces: 6.
	dice1 setValue: 1.
	dice2 := Dice faces: 7.
	dice2 setValue: 1.
	dice := Array with: dice1 with: dice2.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice.
	self assert: (game positionOf: seba) tile equals: 0.
	self assert: (game positionOf: agus) tile equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tile equals: 2.
	self assert: (game positionOf: agus) tile equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tile equals: 2.
	self assert: (game positionOf: agus) tile equals: 4.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tile equals: 8.
	self assert: (game positionOf: agus) tile equals: 4.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tile equals: 8.
	self assert: (game positionOf: agus) tile equals: 12.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tile equals: 18.
	self assert: (game positionOf: agus) tile equals: 12.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tile equals: 18.
	self assert: (game positionOf: agus) tile equals: 4.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 1.
	self deny: game isActive.
	self assert: game winnerOfTheGame equals: agus