tests
testGameCannotBePlayedWhenStateIsntActive
	| game board dice dice1 totalPlayers pepito seba agus |
	pepito := Player named: 'Pepito'.
	seba := Player named: 'Agus'.
	agus := Player named: 'Seba'.
	totalPlayers := OrderedCollection new.
	totalPlayers add: pepito.
	totalPlayers add: seba.
	totalPlayers add: agus.
	board := Board ofSize: 4 withThisGenerator: TileRandomGeneratorNew.
	dice1 := Dice faces: 6.
	dice := Array with: dice1.
	dice1 setValue: 6.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice.
	game nextTurn: pepito.
	self should: [ game nextTurn: seba ] raise: Error