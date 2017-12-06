tests
testWhenPotentiationAppliedWithWormHoleThePositionIsFourTilesBackwards
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards aPotentiationCard aWormholeTile |
	aWormholeTile := WormholeEffect new.
	aPotentiationCard := Potentiation new.
	cards := OrderedCollection new.
	cards add: aPotentiationCard.
	boardGenerator := TileFixedGenerator using: aWormholeTile.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
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
		withThis: deckGenerator.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 7.
	self assert: (game positionOf: seba) rounds equals: -1.
	aPotentiationCard isAppliedBy: seba onThis: game.
	self assert: (game positionOf: seba) tiles equals: 3.
	self assert: (game positionOf: seba) rounds equals: -1