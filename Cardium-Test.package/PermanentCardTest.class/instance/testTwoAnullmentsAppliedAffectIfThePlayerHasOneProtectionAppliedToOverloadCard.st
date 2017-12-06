tests
testTwoAnullmentsAppliedAffectIfThePlayerHasOneProtectionAppliedToOverloadCard
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anOverload deckGenerator cards aProtectionCard anAnullmentCard sebasDeck cardsAffectingSeba |
	anOverload := Overload new.
	anAnullmentCard := Annulment new.
	aProtectionCard := Protection new.
	anAnullmentCard := Annulment new.
	cards := OrderedCollection new.
	cards add: anOverload.
	cards add: aProtectionCard.
	cards add: anAnullmentCard.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	aCardGivingTile := CardGivingEffect new.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
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
	sebasDeck := seba deck.
	cardsAffectingSeba := seba cardsAffectingHim.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	seba deck first isAppliedBy: seba toAffect: seba onThis: game.
	seba deck first
		isAppliedBy: seba
		toProtect: seba cardsAffectingHim first
		of: seba.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 9.
	self assert: (game positionOf: seba) rounds equals: -1.
	seba deck first
		isAppliedBy: seba
		toCancel: seba cardsAffectingHim first
		ofPlayer: seba
		onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 9.
	self assert: (game positionOf: seba) rounds equals: -1.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	seba deck first
		isAppliedBy: seba
		toCancel: seba cardsAffectingHim first
		ofPlayer: seba
		onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 4.
	self assert: (game positionOf: seba) rounds equals: 0