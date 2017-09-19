tests
testWhenPlayerReachesRoundsForWinningTheStateOfTheGameIsEnded

	| game player board player2 dice|
	player:= Player named: 'pepito'.
	board:= Board ofSize: 5.
	dice:= Array with: (Dice faces: 4).
	game:= Game rounds: 1 createdBy: player withThisBoard: board usingDice: dice.
	player2:= game createdBy.
	player2 moveForward: 6 onABoardOf: 5.
	game winner: player2.
	self deny: game isActive. 
	