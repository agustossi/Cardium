tests
testWhenAnnulmentIsUsedWithCushioningCardIsOutOfGame
	| agus aSpeedUpTile game seba board dice dice1 totalPlayers boardGenerator generator anAnnulmentCard deckGenerator cards aCushioningCard |
	aCushioningCard := Cushioning new.
	aSpeedUpTile := SpeedUpEffect new.
	anAnnulmentCard := Annulment new.
	cards := OrderedCollection new.
	cards add: anAnnulmentCard.
	cards add: aCushioningCard.
	boardGenerator := TileFixedGenerator using: aSpeedUpTile.
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
		rounds: 3
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: deckGenerator.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 5.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 5.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 6.
	self assert: (game positionOf: agus) rounds equals: 0.
	aCushioningCard isAppliedBy: seba onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 10.
	self assert: (game positionOf: seba) rounds equals: 1.
	self assert: (game positionOf: agus) tiles equals: 6.
	self assert: (game positionOf: agus) rounds equals: 0.
	anAnnulmentCard isAppliedBy: agus toCancel: aCushioningCard onThis: game.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 10.
	self assert: (game positionOf: seba) rounds equals: 1.
	self assert: (game positionOf: agus) tiles equals: 4.
	self assert: (game positionOf: agus) rounds equals: 1