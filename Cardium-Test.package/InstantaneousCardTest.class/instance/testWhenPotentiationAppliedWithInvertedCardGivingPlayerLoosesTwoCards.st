tests
testWhenPotentiationAppliedWithInvertedCardGivingPlayerLoosesTwoCards
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards aPotentiationCard aCardGivingTile aReversalCard agus |
	aReversalCard := Reversal new.
	aCardGivingTile := CardGivingEffect new.
	aPotentiationCard := Potentiation new.
	cards := OrderedCollection new.
	cards add: aPotentiationCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
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
	self assert: (seba deckSize) equals: 2.
	self assert: (agus deckSize) equals: 2.
	aReversalCard isAppliedBy: seba toReverseTile: 2 onThis: game.
	game nextTurn: seba.
	game nextTurn: agus.
	self assert: (seba deckSize) equals: 2.
	self assert: (agus deckSize) equals: 1.
	aPotentiationCard isAppliedBy: seba onThis: game.
	self assert: (seba deckSize) equals: 1.
	self assert: (agus deckSize) equals: 0