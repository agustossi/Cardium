tests
testPlayersAreCorrectedAddedToGame
	| game board dice dice1 dice2 player1 player2 totalPlayers gameCreator |
	gameCreator := Player named: 'pepito'.
	player1 := Player named: 'Agus'.
	player2 := Player named: 'Seba'.
	totalPlayers := OrderedCollection new.
	totalPlayers add: gameCreator.
	totalPlayers add: player1.
	totalPlayers add: player2.
	board := Board ofSize: 10 withThisGenerator: TileRandomGenerator new.
	dice1 := Dice faces: 6.
	dice2 := Dice faces: 7.
	dice := Array with: dice1 with: dice2.
	game := Game
		rounds: 2
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: (DeckFixedGenerator using: Speed new).
	self assert: game numberOfPlayers equals: 3