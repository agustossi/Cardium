tests
testCardGivingTileEffectAppliedToThisPlayerIsWorking
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator aSpeedCard deckGenerator cards|
	cards := OrderedCollection new.
	cards add: Speed new.
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
	aSpeedCard := Speed new.
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
	self shouldnt: [ seba assertHisDeckHas: aSpeedCard ] raise: GameError