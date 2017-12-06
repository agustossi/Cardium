tests
testCardGivingTileEffectAppliedToThisPlayerIsWorking
	| deckGenerator aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator aSpeedCard sebasDeck  cards|
	aSpeedCard := Speed new.
	cards := OrderedCollection new.
	cards add: aSpeedCard.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	aCardGivingTile := CardGivingEffect new.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.	
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis:
			(DeckFixedGenerator
				using:
					(OrderedCollection new
						add: aSpeedCard;
						yourself)).
	game nextTurn: seba.
	sebasDeck := seba deck.
	self
		shouldnt: [ seba assertHisDeckHas: (sebasDeck first) ]
		raise: GameError