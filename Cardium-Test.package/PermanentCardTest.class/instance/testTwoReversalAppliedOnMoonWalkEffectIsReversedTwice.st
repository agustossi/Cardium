tests
testTwoReversalAppliedOnMoonWalkEffectIsReversedTwice
	| aMoonWalkTile game seba agus board dice dice1 totalPlayers boardGenerator generator aReversalCard deckGenerator cards |
	
	aMoonWalkTile := MoonWalkEffect new.
	aReversalCard := Reversal new.
	cards := OrderedCollection new.
	cards add: aReversalCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: aMoonWalkTile.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
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
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 0.
	aReversalCard isAppliedBy: seba toReverseTile: 1 onThis: game.
	aReversalCard isAppliedBy: seba toReverseTile: 1 onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: agus) rounds equals: -1.
	self assert: (game positionOf: agus) tiles equals: 7