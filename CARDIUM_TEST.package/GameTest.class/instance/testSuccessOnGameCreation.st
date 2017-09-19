tests
testSuccessOnGameCreation

	| game player board dice dice1 dice2 |
	player:= Player named: 'pepito'.
	board:= Board ofSize: 10.
	dice1:= Dice faces: 6.
	dice2:= Dice faces: 7.
	dice:= Array with: dice1 with: dice2.
	game:= Game rounds: 2 createdBy: player withThisBoard: board usingDice: dice.
	self assert: game isActive;
		  assert: game createdBy name equals: 'pepito';
		  assert: game dice equals: dice;
		  assert: game board equals: board;
		  assert: game roundsToWin equals: 2.