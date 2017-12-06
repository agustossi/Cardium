tests
testPlayingUntilWinningWithTwoDice
	| game seba board dice dice1 dice2 agus totalPlayers aEffectlesTile boardGenerator generator generator1 cards deckGenerator |
	cards := OrderedCollection new.
	cards add: Speed new.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	aEffectlesTile := Effectles new.
	boardGenerator := TileFixedGenerator using: aEffectlesTile.
	board := Board ofSize: 20 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	generator1 := FixedNumberGenerator startFrom: 0.
	dice2 := Dice faces: 7 rollingFrom: generator1.
	dice := Array with: dice1 with: dice2.
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
	self assert: (game positionOf: seba) tiles equals: 2.
	self assert: (game positionOf: agus) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 2.
	self assert: (game positionOf: agus) tiles equals: 4.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 8.
	self assert: (game positionOf: agus) tiles equals: 4.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 8.
	self assert: (game positionOf: agus) tiles equals: 12.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 18.
	self assert: (game positionOf: agus) tiles equals: 12.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 18.
	self assert: (game positionOf: agus) tiles equals: 4.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: agus) rounds equals: 1.
	self assert: game winnerOfTheGame equals: agus