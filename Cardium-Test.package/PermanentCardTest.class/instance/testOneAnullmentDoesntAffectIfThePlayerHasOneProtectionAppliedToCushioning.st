tests
testOneAnullmentDoesntAffectIfThePlayerHasOneProtectionAppliedToCushioning
	| aSpeedUpTile game seba board dice dice1 totalPlayers boardGenerator generator aCushioningCard deckGenerator cards aProtectionCard anAnullmentCard sebasDeck globalDeck |
	
	aCushioningCard := Cushioning new.
	anAnullmentCard := Annulment new.
	aProtectionCard := Protection new.
	cards := OrderedCollection new.
	cards add: aCushioningCard.
	cards add: aProtectionCard.
	cards add: anAnullmentCard.
	deckGenerator := DeckFixedGenerator using: cards.
	
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	aSpeedUpTile := SpeedUpEffect new.
	
	boardGenerator := TileFixedGenerator using: aSpeedUpTile.
	
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
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	sebasDeck := seba deck.
	globalDeck := game cardsAffectingAllPlayers.
	(seba deck first) isAppliedBy: seba onThis: game.
	(sebasDeck first) isAppliedBy: seba toProtect: globalDeck first onThis: game. 	
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 3.
	self assert: (game positionOf: seba) rounds equals: 0.
	(sebasDeck first) isAppliedBy: seba toCancel: (globalDeck first) onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 7.
	self assert: (game positionOf: seba) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 2.
	self assert: (game positionOf: seba) rounds equals: 1