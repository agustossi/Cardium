tests
testWhenUndoAppliedWithAtomicBombTheEffectUndoes
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards anUndoCard anAtomicBombTile agus |
	
	anUndoCard := Undo new.
	cards := OrderedCollection new.
	cards add: anUndoCard.
	deckGenerator := DeckFixedGenerator using: cards.
	
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	anAtomicBombTile := AtomicBombEffect new.
	
	boardGenerator := TileFixedGenerator using: anAtomicBombTile.
	
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
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: agus.
	(seba deck first) isAppliedBy: seba onThis: game.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 2.
	self assert: (game positionOf: agus) rounds equals: 0