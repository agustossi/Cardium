tests
testPlayingUntilWinningWithOneDice
	| game seba board dice dice1 agus totalPlayers aEffectlesTile boardGenerator |
	seba := Player named: 'sebastian'.
	agus := Player named: 'agustina'.
	aEffectlesTile:= Effectles new.
	boardGenerator := TileFixedGenerator using: aEffectlesTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	dice1:= Dice faces: 6.
	dice1 setValue: 1.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: agus) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: agus) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: agus) tiles equals: 2.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 4.
	self assert: (game positionOf: agus) tiles equals: 2.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 4.
	self assert: (game positionOf: agus) tiles equals: 6.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 9.
	self assert: (game positionOf: agus) tiles equals: 6.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 9.
	self assert: (game positionOf: agus) tiles equals: 2.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 1.
	self deny: game isActive.
	self assert: game winnerOfTheGame equals: agus