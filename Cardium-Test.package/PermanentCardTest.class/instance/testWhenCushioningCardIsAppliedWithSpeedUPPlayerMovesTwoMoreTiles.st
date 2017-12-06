tests
testWhenCushioningCardIsAppliedWithSpeedUPPlayerMovesTwoMoreTiles
	| aSpeedUpTile game seba board dice dice1 totalPlayers boardGenerator generator aCushioningCard deckGenerator agus cards |
	
	aCushioningCard := Cushioning new.
	cards := OrderedCollection new.
	cards add: aCushioningCard.
	deckGenerator := DeckFixedGenerator using: cards.
	
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	aSpeedUpTile := SpeedUpEffect new.
	
	boardGenerator := TileFixedGenerator using: aSpeedUpTile.
	
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	game := Game
		rounds: 5
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: deckGenerator.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 0.
	game nextTurn: seba.
	game nextTurn: agus.
	(seba deck first) isAppliedBy: seba onThis: game.
	game nextTurn: seba.
	game nextTurn: agus.
	self assert: (game positionOf: seba) rounds equals: 1.
	self assert: (game positionOf: seba) tiles equals: 10.
	self assert: (game positionOf: agus) rounds equals: 1.
	self assert: (game positionOf: agus) tiles equals: 2