tests
testMoonWalkTileEffectAppliedToThisPlayerIsWorking
	| aMoonWalkTile game seba board dice dice1 totalPlayers agus boardGenerator generator |
	seba := Player named: 'sebastian'.
	agus := Player named: 'Agustina'.
	aMoonWalkTile := MoonWalk new.
	boardGenerator := TileFixedGenerator using: aMoonWalkTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: (DeckFixedGenerator using: Speed new).
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 0.
	game nextTurn: seba.
	game nextTurn: agus.
	self assert: (game positionOf: seba) rounds equals: -1.
	self assert: (game positionOf: seba) tiles equals: 8.
	self assert: (game positionOf: agus) rounds equals: -1.
	self assert: (game positionOf: agus) tiles equals: 9