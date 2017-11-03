tests
testPlayerCannotPlayIfItsNotHisTurn
	| game seba board dice dice1 agus totalPlayers |
	seba := Player named: 'sebastian'.
	agus := Player named: 'agustina'.
	board := Board ofSize: 10 withThisGenerator: TileRandomGenerator new.
	dice1 := Dice faces: 6.
	dice1 setValue: 1.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice.
	self should: [ game nextTurn: agus ] raise: Error