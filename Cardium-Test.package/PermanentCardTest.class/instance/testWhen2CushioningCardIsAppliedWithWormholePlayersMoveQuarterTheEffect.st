tests
testWhen2CushioningCardIsAppliedWithWormholePlayersMoveQuarterTheEffect
	| aWormholeTile game seba board dice dice1 totalPlayers boardGenerator generator aCushioningCard deckGenerator agus cards |
	
	aWormholeTile := WormholeEffect new.
	aCushioningCard := Cushioning new.
	cards := OrderedCollection new.
	cards add: aCushioningCard.
	cards add: aCushioningCard.
	boardGenerator := TileFixedGenerator using: aWormholeTile.
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
	aCushioningCard isAppliedBy: seba onThis: game.
	game nextTurn: seba.
	aCushioningCard isAppliedBy: agus onThis: game.
	game nextTurn: agus.
	self assert: (game positionOf: seba) rounds equals: -1.
	self assert: (game positionOf: seba) tiles equals: 9.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 1