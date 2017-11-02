tests
testWinnerCantBeReturnedWhilePlaying
	| game board dice dice1 player1 player2 totalPlayers player0 |
	player0 := Player named: 'pepito'.
	player1 := Player named: 'Agus'.
	player2 := Player named: 'Seba'.
	totalPlayers := OrderedCollection new.
	totalPlayers add: player0.
	totalPlayers add: player1.
	totalPlayers add: player2.
	board := Board ofSize: 10 withThisGenerator: TileRandomGeneratorNew.
	dice1 := Dice faces: 6.
	dice := Array with: dice1.
	dice1 setValue: 6.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice.
	game nextTurn: player0.
	self should: [ game winnerOfTheGame ] raise: Error