tests
testWhenOverloadCardIsAppliedToOtherPlayerThePlayerMovesWhatTheDiceSaysMinusTwo
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anOverloadCard deckGenerator agus cards |
	seba := Player named: 'sebastian'.
	agus := Player named: 'agustina'.
	aCardGivingTile := CardGivingEffect new.
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
	game thePlayer: seba appliesPermanent: anOverloadCard on: agus.
	game nextTurn: seba.
	game nextTurn: agus.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 4.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: (game positionOf: agus) tiles equals: 4.