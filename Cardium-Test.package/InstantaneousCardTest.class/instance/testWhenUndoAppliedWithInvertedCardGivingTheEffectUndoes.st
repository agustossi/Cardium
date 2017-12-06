tests
testWhenUndoAppliedWithInvertedCardGivingTheEffectUndoes
	| game seba agus board dice dice1 totalPlayers boardGenerator generator deckGenerator cards anUndoCard aReversalCard aCardGivingTile |
	aReversalCard := Reversal new.
	anUndoCard := Undo new.
	aCardGivingTile := CardGivingEffect new.
	cards := OrderedCollection new.
	cards add: anUndoCard.
	cards add: aReversalCard.
	cards add: anUndoCard.
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
	self assert: (seba deckSize) equals: 3.
	aReversalCard isAppliedBy: seba toReverseTile: 1 onThis: game.
	self assert: (seba deckSize) equals: 2.
	game nextTurn: seba.
	self assert: (seba deckSize) equals: 1.
	anUndoCard isAppliedBy: seba onThis: game.
	self assert: (seba deckSize) equals: 1