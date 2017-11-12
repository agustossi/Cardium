tests
testCardGivingTileEffectAppliedToThisPlayerIsWorking
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator aSpeedCard |
	seba := Player named: 'sebastian'.
	aCardGivingTile := CardGiving new.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	aSpeedCard := Speed new.
	game := Game rounds: 1 playedBy: totalPlayers withThisBoard: board usingDice: dice withThis: (DeckFixedGenerator using: ((OrderedCollection new) add: aSpeedCard; yourself)).
	game nextTurn: seba.
	self assert: (game assertThePlayersDeckHasThis: aSpeedCard ) equals: game.