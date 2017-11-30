tests
testReversalAppliedOnAtomicBombEffectStaysTheSame
	| anAtomicBomb game seba board dice dice1 totalPlayers boardGenerator generator aReversalCard deckGenerator cards|
	seba := Player named: 'sebastian'.
	anAtomicBomb := AtomicBombEffect new.
	aReversalCard := Reversal new.	
	cards := OrderedCollection new.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: anAtomicBomb.
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
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	game thePlayer: seba applies: aReversalCard onTile: 1. 
	game nextTurn: seba.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.