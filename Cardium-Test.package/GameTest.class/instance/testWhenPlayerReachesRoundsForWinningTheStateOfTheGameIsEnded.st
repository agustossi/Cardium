tests
testWhenPlayerReachesRoundsForWinningTheStateOfTheGameIsEnded
	| game player board dice totalPlayers |
	player := Player named: 'pepito'.
	totalPlayers := OrderedCollection new.
	totalPlayers add: player.
	board := Board ofSize: 5 withThisGenerator: TileRandomGenerator new.
	dice := Array with: (Dice faces: 6).
	(dice at: 1) setValue: 6.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice.
	game nextTurn: player.
	game isWinner: player.
	self deny: game isActive