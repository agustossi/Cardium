tests
testWinnerCantBeReturnedWhilePlaying
	| game board dice dice1 player1 player2 totalPlayers player0 generator|
	player0 := Player named: 'pepito'.
	player1 := Player named: 'Agus'.
	player2 := Player named: 'Seba'.
	totalPlayers := OrderedCollection new.
	totalPlayers add: player0.
	totalPlayers add: player1.
	totalPlayers add: player2.
	board := Board ofSize: 10 withThisGenerator: TileRandomGenerator new.
	generator:= FixedNumberGenerator startFrom:0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice1 := Dice faces: 6.
	dice := Array with: dice1.	
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice.
	game nextTurn: player0.
	self should: [ game winnerOfTheGame ] raise: GameError withExceptionDo: [:signal | self assert: signal messageText equals: 'There isnt a winner yet'].