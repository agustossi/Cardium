tests
testPlayersAreCorrectedAddedToGame

	| game board dice dice1 dice2 gameCreator player1 player2 totalPlayers |
	gameCreator:= Player named: 'pepito'.
	board:= Board ofSize: 10.
	dice1:= Dice faces: 6.
	dice2:= Dice faces: 7.
	dice:= Array with: dice1 with: dice2.
	game:= Game rounds: 2 createdBy: gameCreator withThisBoard: board usingDice: dice.
	player1:= Player named: 'Agus'.
	player2:= Player named: 'Seba'.
	game addPlayer: player1.
	game addPlayer: player2.	
	self assert: game playedBy equals: 3.