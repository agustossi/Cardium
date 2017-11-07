tests
testWhenPlayerReachesRoundsForWinningTheStateOfTheGameIsEnded
	| game player board dice totalPlayers generator dice1|
	player := Player named: 'pepito'.
	totalPlayers := OrderedCollection new.
	totalPlayers add: player.
	board := Board ofSize: 5 withThisGenerator: TileRandomGenerator new.
	generator:= FixedNumberGenerator startFrom:5.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice.
	game nextTurn: player.
	game isWinner: player.
	self deny: game isActive