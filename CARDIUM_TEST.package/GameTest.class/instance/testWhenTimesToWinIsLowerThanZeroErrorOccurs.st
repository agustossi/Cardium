tests
testWhenTimesToWinIsLowerThanZeroErrorOccurs

	| game player board dice dice1 dice2 |
	player:= Player named: 'pepito'.
	board:= Board ofSize: 10.
	dice1:= Dice faces: 6.
	dice2:= Dice faces: 7.
	dice:= Array with: dice1 with: dice2.
	self should: [  Game rounds: 0 createdBy: player withThisBoard: board usingDice: dice ] raise: Error.
