tests
testWhenReversalAppliedOnCardGivingTilePlayerLoosesOneCard
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator aReversalCard deckGenerator cards |
	
	aCardGivingTile := CardGivingEffect new.
	aReversalCard := Reversal new.
	cards := OrderedCollection new.
	cards add: aReversalCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
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
	self assert: (seba deckSize) equals: 2.
	aReversalCard isAppliedBy: seba toReverseTile: 1 onThis: game.
	game nextTurn: seba.
	self assert: (seba deckSize) equals: 0