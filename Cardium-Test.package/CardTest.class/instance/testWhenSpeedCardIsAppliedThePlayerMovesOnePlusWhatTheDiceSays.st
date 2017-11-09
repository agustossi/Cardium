tests
testWhenSpeedCardIsAppliedThePlayerMovesOnePlusWhatTheDiceSays
	| anEffectlesTile game seba board dice dice1 totalPlayers boardGenerator generator aSpeedCard playersDeck deckGame deckGenerator |
	seba := Player named: 'sebastian'.
	anEffectlesTile := Effectles new.
	aSpeedCard := Speed new.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	deckGenerator := DeckFixedGenerator using: aSpeedCard.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	playersDeck := Dictionary new.
	playersDeck at: seba put: (OrderedCollection new add: aSpeedCard; yourself).
	deckGame := OrderedCollection new.
	game := Game rounds: 1 playedBy: totalPlayers withThisBoard: board usingDice: dice withThis: deckGenerator.
	game add: aSpeedCard to: seba.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	game thePlayer: seba appliesPermanent: aSpeedCard on: seba.
	game nextTurn: seba.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 1