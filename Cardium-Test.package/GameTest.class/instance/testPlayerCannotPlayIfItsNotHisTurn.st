tests
testPlayerCannotPlayIfItsNotHisTurn
	| game seba board dice dice1 agus totalPlayers generator cards deckGenerator|
	cards := OrderedCollection new.
	cards add: Speed new.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
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
		withThis:
			(DeckFixedGenerator
				using:
					(OrderedCollection new
						add: Speed new;
						yourself)).
	self
		should: [ game nextTurn: agus ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'It is not your turn' ]