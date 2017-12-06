tests
testWhenPotentiationAppliedWithInverteMoonWalkOtherPlayersMove6Tiles
	| game seba agus board dice dice1 totalPlayers boardGenerator generator deckGenerator cards aPotentiationCard aMoonWalkTile aReversalCard |
	aReversalCard := Reversal new.
	aMoonWalkTile := MoonWalkEffect new.
	aPotentiationCard := Potentiation new.
	cards := OrderedCollection new.
	cards add: aPotentiationCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: aMoonWalkTile.
	deckGenerator := DeckFixedGenerator using: cards.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
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
		withThis: deckGenerator.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	aReversalCard isAppliedBy: seba toReverseTile: 1 onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 3.
	self assert: (game positionOf: agus) rounds equals: 0.
	aPotentiationCard isAppliedBy: seba onThis: game.
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 6.
	self assert: (game positionOf: agus) rounds equals: 0