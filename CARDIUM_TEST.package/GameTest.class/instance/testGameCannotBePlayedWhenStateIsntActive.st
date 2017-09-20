tests
testGameCannotBePlayedWhenStateIsntActive
	| game board dice dice1 player1 player2 totalPlayers gameCreator |
	gameCreator := Player named: 'pepito'.
	player1 := Player named: 'Agus'.
	player2 := Player named: 'Seba'.
	totalPlayers:= OrderedCollection new.
	totalPlayers add: gameCreator.
	totalPlayers add: player1.
	totalPlayers add: player2.
	board := Board ofSize: 4.
	dice1 := Dice faces: 6.
	dice := Array with: dice1.
	dice1 setValue: 6.
	game := Game rounds: 1 playedBy: totalPlayers withThisBoard: board usingDice: dice.
	game nextTurn.
	self should: [ game nextTurn ] raise: Error.