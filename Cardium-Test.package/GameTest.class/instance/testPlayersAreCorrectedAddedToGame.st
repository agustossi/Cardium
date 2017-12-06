tests
testPlayersAreCorrectedAddedToGame
	| game board dice dice1 dice2 player1 player2 totalPlayers gameCreator cards deckGenerator |
	cards:= OrderedCollection new.
	cards add: (Speed new).
	deckGenerator:= DeckFixedGenerator using: cards.
	gameCreator := Player
		named: 'pepito'
		calculatingDeckWith: deckGenerator.
	player1 := Player named: 'Agus' calculatingDeckWith: deckGenerator.
	player2 := Player named: 'Seba' calculatingDeckWith: deckGenerator.
	totalPlayers := OrderedCollection new.
	totalPlayers add: gameCreator.
	totalPlayers add: player1.
	totalPlayers add: player2.
	board := Board ofSize: 10 withThisGenerator: TileRandomGenerator new.
	dice1 := Dice faces: 6.
	dice2 := Dice faces: 7.
	dice := Array with: dice1 with: dice2.
	game := Game
		rounds: 2
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis:
			(DeckFixedGenerator
				using:
					(OrderedCollection new
						add: Speed new;
						yourself)).
	self assert: game numberOfPlayers equals: 3