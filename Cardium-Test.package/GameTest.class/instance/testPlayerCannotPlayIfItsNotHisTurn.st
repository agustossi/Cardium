tests
testPlayerCannotPlayIfItsNotHisTurn
	| game seba board dice dice1 agus totalPlayers generator |
	seba := Player named: 'sebastian'.
	agus := Player named: 'agustina'.
	board := Board ofSize: 10 withThisGenerator: TileRandomGenerator new.
	generator := FixedNumberGenerator startFrom: 4.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: (DeckFixedGenerator using: Speed new).
	self
		should: [ game nextTurn: agus ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'It is not your turn' ]