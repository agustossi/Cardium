tests
testWhenPlayerReachesRoundsForWinningTheStateOfTheGameIsEnded
	| game player board dice totalPlayers generator dice1 anEffectlesTile |
	player := Player named: 'pepito'.
	totalPlayers := OrderedCollection new.
	totalPlayers add: player.
	anEffectlesTile := Effectles new.
	generator := TileFixedGenerator using: anEffectlesTile.
	board := Board ofSize: 5 withThisGenerator: generator.
	generator := FixedNumberGenerator startFrom: 5.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: (DeckFixedGenerator using: Speed new).
	game nextTurn: player.
	game isWinner: player.
	self deny: game isActive