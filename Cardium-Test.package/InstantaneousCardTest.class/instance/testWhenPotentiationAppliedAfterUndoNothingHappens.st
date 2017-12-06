tests
testWhenPotentiationAppliedAfterUndoNothingHappens
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards aPotentiationCard aCardGIvingTile anUndoCard |
	aCardGIvingTile := CardGivingEffect new.
	aPotentiationCard := Potentiation new.
	anUndoCard := Undo new.
	cards := OrderedCollection new.
	cards add: aPotentiationCard.
	cards add: anUndoCard.
	boardGenerator := TileFixedGenerator using: aCardGIvingTile.
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
	self assert: (seba deckSize) equals: 2.
	game nextTurn: seba.
	self assert: (seba deckSize) equals: 3.
	game nextTurn: seba.
	self assert: (seba deckSize) equals: 4.
	anUndoCard isAppliedBy: seba onThis: game.
	self assert: (seba deckSize) equals: 2.
	aPotentiationCard isAppliedBy: seba onThis: game.
	self assert: (seba deckSize) equals: 1