tests
testWhenGameIsCreatedEachPlayerHasTwoCards
	| game board dice dice1 player1 player2 totalPlayers player0 generator deckGenerator |
	deckGenerator := DeckRandomGenerator new.
	player0 := Player named: 'pepito' calculatingDeckWith: deckGenerator.
	player1 := Player named: 'Agus' calculatingDeckWith: deckGenerator.
	player2 := Player named: 'Seba' calculatingDeckWith: deckGenerator.
	totalPlayers := OrderedCollection new.
	totalPlayers add: player0.
	totalPlayers add: player1.
	totalPlayers add: player2.
	board := Board ofSize: 10 withThisGenerator: TileRandomGenerator new.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice1 := Dice faces: 6.
	dice := Array with: dice1.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: DeckRandomGenerator new.
	self assert: (player0 deckSize) equals: 2.
	self assert: (player1 deckSize ) equals: 2.
	self assert: (player2 deckSize) equals: 2