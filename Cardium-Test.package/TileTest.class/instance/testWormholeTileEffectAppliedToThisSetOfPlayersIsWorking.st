tests
testWormholeTileEffectAppliedToThisSetOfPlayersIsWorking
	| aWormholeTile game seba board dice dice1 totalPlayers boardGenerator |
	seba := Player named: 'sebastian'.
	aWormholeTile  := Wormhole  new.
	boardGenerator := TileFixedGenerator using: aWormholeTile .
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	dice1 := Dice faces: 6.
	dice1 setValue: 1.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) rounds equals: -1.
	self assert: (game positionOf: seba) tiles equals: 7.