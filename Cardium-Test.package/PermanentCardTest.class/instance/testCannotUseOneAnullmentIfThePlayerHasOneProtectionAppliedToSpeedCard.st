tests
testCannotUseOneAnullmentIfThePlayerHasOneProtectionAppliedToSpeedCard
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator aSpeedCard deckGenerator cards aProtectionCard anAnullmentCard |
	seba := Player named: 'sebastian'.
	aCardGivingTile := CardGivingEffect new.
	aSpeedCard := Speed new.
	anAnullmentCard := Annulment new.
	aProtectionCard := Protection new.
	cards := OrderedCollection new.
	cards add: aSpeedCard.
	cards add: aProtectionCard.
	cards add: anAnullmentCard.
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
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	game thePlayer: seba appliesPermanent: aSpeedCard on: seba.
	game thePlayer: seba protects: aSpeedCard on: seba using: aProtectionCard.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 2.
	self assert: (game positionOf: seba) rounds equals: 0.	
	self
		should: [ game thePlayer: seba applies: anAnullmentCard toCancel: aSpeedCard effectOnPlayer: seba ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'It is protected' ]