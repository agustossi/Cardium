tests
testWhenPlayerReachesRoundsForWinningTheStateOfTheGameIsEnded
	| game player board dice totalPlayers generator dice1 anEffectlesTile cards deckGenerator |
	cards := OrderedCollection new.
	cards add: Speed new.
	deckGenerator := DeckFixedGenerator using: cards.
	player := Player named: 'pepito' calculatingDeckWith: deckGenerator.
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
		withThis:
			(DeckFixedGenerator
				using:
					(OrderedCollection new
						add: Speed new;
						yourself)).
	game nextTurn: player.
	game isWinner: player.
	self
		should: [ game isActive ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Game has finished' ]