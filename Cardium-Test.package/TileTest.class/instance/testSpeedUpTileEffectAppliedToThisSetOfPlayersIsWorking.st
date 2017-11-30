tests
testSpeedUpTileEffectAppliedToThisSetOfPlayersIsWorking
	| aSpeedUpTile game seba board dice dice1 totalPlayers boardGenerator generator |
	seba := Player named: 'sebastian'.
	aSpeedUpTile := SpeedUpEffect new.
	boardGenerator := TileFixedGenerator using: aSpeedUpTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: (DeckFixedGenerator using: ((OrderedCollection new) add: (Speed new); yourself)).
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 5