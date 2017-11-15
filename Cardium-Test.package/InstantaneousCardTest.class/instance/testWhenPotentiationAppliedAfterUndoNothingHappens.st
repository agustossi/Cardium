tests
testWhenPotentiationAppliedAfterUndoNothingHappens
	|   game seba board dice dice1 totalPlayers boardGenerator generator  deckGenerator cards aPotentiationCard aCardGIvingTile anUndoCard |
	seba := Player named: 'sebastian'.	
	aCardGIvingTile := CardGivingEffect new.
	aPotentiationCard := Potentiation new.
	anUndoCard := Undo new.
	cards := OrderedCollection new.	
	cards add: aPotentiationCard.
	cards add: anUndoCard.
	
	boardGenerator := TileFixedGenerator using: aCardGIvingTile.
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
	self assert: (game deckSizeOf: seba) equals: 2.
	game nextTurn: seba.
	self assert: (game deckSizeOf: seba) equals: 3.
	game nextTurn: seba.
	self assert: (game deckSizeOf: seba) equals: 4.
	game thePlayer: seba applies: anUndoCard.
	self assert: (game deckSizeOf: seba) equals: 2.
	game thePlayer: seba applies: aPotentiationCard.
	self assert: (game deckSizeOf: seba) equals: 1.