tests
testWhenOverloadCardIsAppliedThePlayerMovesWhatTheDiceSaysMinusTwo
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anOverloadCard deckGenerator cards|
	seba := Player named: 'sebastian'.
	aCardGivingTile := CardGiving new.
	anOverloadCard := Overload new.	
	cards := OrderedCollection new.
	cards add: anOverloadCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
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
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	game nextTurn: seba.
	game thePlayer: seba appliesPermanent: anOverloadCard on: seba.
	game nextTurn: seba.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 1.