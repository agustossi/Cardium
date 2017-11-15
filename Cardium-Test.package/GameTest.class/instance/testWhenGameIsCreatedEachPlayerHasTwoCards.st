tests
testWhenGameIsCreatedEachPlayerHasTwoCards
	| game board dice dice1 player1 player2 totalPlayers player0 generator |
	player0 := Player named: 'pepito'.
	player1 := Player named: 'Agus'.
	player2 := Player named: 'Seba'.
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
		withThis: (DeckRandomGenerator new).
	self assert: (game deckSizeOf: player0) equals: 2.
	self assert: (game deckSizeOf: player1) equals: 2.
	self assert: (game deckSizeOf: player2) equals: 2.