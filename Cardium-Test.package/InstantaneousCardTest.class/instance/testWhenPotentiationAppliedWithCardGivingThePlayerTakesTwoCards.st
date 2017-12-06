tests
testWhenPotentiationAppliedWithCardGivingThePlayerTakesTwoCards
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards aPotentiationCard aCardGivingTile |
	cards:= OrderedCollection new.
	cards add: (Speed new).
	deckGenerator:= DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	aCardGivingTile := CardGivingEffect new.
	aPotentiationCard := Potentiation new.
	cards := OrderedCollection new.
	cards add: aPotentiationCard.
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
	self assert: (seba deckSize) equals: 1.
	game nextTurn: seba.
	self assert: (seba deckSize) equals: 2.
	(seba deck second) isAppliedBy: seba onThis: game.
	self assert: (seba deckSize) equals: 2