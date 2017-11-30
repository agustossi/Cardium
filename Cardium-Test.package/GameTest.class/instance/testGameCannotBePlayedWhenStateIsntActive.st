tests
testGameCannotBePlayedWhenStateIsntActive
	| game board dice dice1 totalPlayers pepito seba agus generator boardGenerator aEffectlesTile |
	pepito := Player named: 'Pepito'.
	seba := Player named: 'Agus'.
	agus := Player named: 'Seba'.
	totalPlayers := OrderedCollection new.
	totalPlayers add: pepito.
	totalPlayers add: seba.
	totalPlayers add: agus.
	aEffectlesTile := Effectles new.
	boardGenerator := TileFixedGenerator using: aEffectlesTile.
	board := Board ofSize: 5 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 5.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: (DeckFixedGenerator using: ((OrderedCollection new) add: (Speed new); yourself)).
	game nextTurn: pepito.
	self
		should: [ game nextTurn: seba ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Game has finished' ]