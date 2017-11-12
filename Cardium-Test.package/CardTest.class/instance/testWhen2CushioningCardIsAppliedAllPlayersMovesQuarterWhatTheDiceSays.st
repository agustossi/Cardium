tests
testWhen2CushioningCardIsAppliedAllPlayersMovesQuarterWhatTheDiceSays
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator aCushioningCard deckGenerator agus cards |
	seba := Player named: 'sebastian'.
	agus := Player named: 'agustina'.
	aCardGivingTile := CardGiving new.
	aCushioningCard := Cushioning new.
	cards := OrderedCollection new.
	cards add: aCushioningCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
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
	
	game nextTurn: seba.	
	game nextTurn: agus.
	game thePlayer: seba appliesPermanent: aCushioningCard.	
	game nextTurn: seba.
	game thePlayer: agus appliesPermanent: aCushioningCard.
	game nextTurn: agus.
	
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 3.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 3.
	
	