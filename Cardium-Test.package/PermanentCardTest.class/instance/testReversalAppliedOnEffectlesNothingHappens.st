tests
testReversalAppliedOnEffectlesNothingHappens
	| anEffectlesTile game seba board dice dice1 totalPlayers boardGenerator generator aReversalCard deckGenerator cards |
	
	anEffectlesTile := Effectles new.
	aReversalCard := Reversal new.
	cards := OrderedCollection new.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
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
	aReversalCard isAppliedBy: seba toReverseTile: 1 onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 1