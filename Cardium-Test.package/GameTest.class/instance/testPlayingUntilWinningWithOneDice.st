tests
testPlayingUntilWinningWithOneDice
	| game seba board dice dice1 agus totalPlayers aEffectlesTile boardGenerator generator cards deckGenerator |
	cards:= OrderedCollection new.
	cards add: (Speed new).
	deckGenerator:= DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	aEffectlesTile := Effectles new.
	boardGenerator := TileFixedGenerator using: aEffectlesTile.
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
		withThis:
			(DeckFixedGenerator
				using:
					(OrderedCollection new
						add: Speed new;
						yourself)).
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: agus) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: agus) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: agus) tiles equals: 2.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 4.
	self assert: (game positionOf: agus) tiles equals: 2.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 4.
	self assert: (game positionOf: agus) tiles equals: 6.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 9.
	self assert: (game positionOf: agus) tiles equals: 6.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 9.
	self assert: (game positionOf: agus) tiles equals: 2.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 1.
	self assert: game winnerOfTheGame equals: agus