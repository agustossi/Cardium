tests
testWhenUndoAppliedWithCardGivingTheEffectUndoes
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards anUndoCard aCardGivingTile |
	anUndoCard := Undo new.
	cards := OrderedCollection new.
	cards add: anUndoCard.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	aCardGivingTile := CardGivingEffect new.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
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
	self assert: (seba deckSize) equals: 1.
	game nextTurn: seba.
	self assert: (seba deckSize) equals: 2.
	anUndoCard isAppliedBy: seba onThis: game.
	self assert: (seba deckSize) equals: 0