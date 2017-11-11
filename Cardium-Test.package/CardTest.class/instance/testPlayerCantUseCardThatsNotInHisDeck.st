tests
testPlayerCantUseCardThatsNotInHisDeck
	| anEffectlesTile game seba board dice dice1 totalPlayers boardGenerator generator anOverloadCard   deckGenerator |
	seba := Player named: 'sebastian'.
	anEffectlesTile := Effectles new.
	anOverloadCard := Overload new.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	deckGenerator := DeckFixedGenerator using: anOverloadCard .
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 3.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	game := Game rounds: 1 playedBy: totalPlayers withThisBoard: board usingDice: dice withThis: deckGenerator.
	
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	self should: [game thePlayer: seba appliesPermanent: anOverloadCard on: seba] raise: GameError withExceptionDo: [:signal | self assert: signal messageText equals: 'Player doesnt have this card'].
	