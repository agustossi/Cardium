tests
testWhenUndoAppliedWithInvertedWormholeTheEffectUndoes
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards anUndoCard aReversalCard aWormholeTile |
	aReversalCard := Reversal new.
	anUndoCard := Undo new.
	aWormholeTile := WormholeEffect new.
	cards := OrderedCollection new.
	cards add: anUndoCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: aWormholeTile.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	board := Board ofSize: 17 withThisGenerator: boardGenerator.
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
	self assert: (game positionOf: seba) tiles equals: 5.
	self assert: (game positionOf: seba) rounds equals: 0.
	anUndoCard isAppliedBy: seba onThis: game.
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: seba) rounds equals: 0