tests
testWhenPlayerReachesRoundsForWinningTheStateOfTheGameIsEnded

	| game player board dice totalPlayers |
	player:= Player named: 'pepito'.
	totalPlayers:= OrderedCollection new.
	totalPlayers add: player.
	board:= Board ofSize: 5.
	dice:= Array with: (Dice faces: 4).
	game:= Game rounds: 1 playedBy: totalPlayers withThisBoard: board usingDice: dice.
	player moveForward: 6 onABoardOf: 5.
	game winner: player.
	self deny: game isActive. 
	