tests
testWhenPotentiationAppliedWithInvertedWormholePlayerMoves8Tiles
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards aPotentiationCard anWormholeTile aReversalCard |
	aReversalCard := Reversal new.
	anWormholeTile := WormholeEffect new.
	aPotentiationCard := Potentiation new.
	cards := OrderedCollection new.
	cards add: aPotentiationCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: anWormholeTile.
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
	aReversalCard isAppliedBy: seba toReverseTile: 1 onThis: game.
	game nextTurn: seba.
	aPotentiationCard isAppliedBy: seba onThis: game.
	self assert: (game positionOf: seba) tiles equals: 9.
	self assert: (game positionOf: seba) rounds equals: 0