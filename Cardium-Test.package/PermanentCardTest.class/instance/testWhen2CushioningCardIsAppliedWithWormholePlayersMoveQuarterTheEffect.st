tests
testWhen2CushioningCardIsAppliedWithWormholePlayersMoveQuarterTheEffect
	| aWormholeTile game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator agus cards |
	cards := OrderedCollection new.
	cards add: Cushioning new.
	cards add: Cushioning new.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	aWormholeTile := WormholeEffect new.	
	
	boardGenerator := TileFixedGenerator using: aWormholeTile.
	
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
	(seba deck first) isAppliedBy: seba onThis: game.
	game nextTurn: seba.
	(agus deck first) isAppliedBy: agus onThis: game.	
	game nextTurn: agus.
	self assert: (game positionOf: seba) rounds equals: -1.
	self assert: (game positionOf: seba) tiles equals: 9.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 1