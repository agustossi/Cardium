initialization
initializeRounds: aRound initializePlayers: somePlayers initializeBoard: aBoard initializeDice: aDice initializeDeck: deckGenerator
	rounds := aRound.
	players := somePlayers.
	board := aBoard.
	dice := aDice.
	state := GameActive whilePlaying:(somePlayers at:1).
	playerIndex := 1.
	positionCalculator := PositionCalculator new.
	playerPositions := Dictionary new.	
	deck := OrderedCollection new.
	self initializeDeckWithThisGenerator: deckGenerator.
	self playersPositionInizialization.		
	allTilesStepped := OrderedCollection new.
	allCardsUsed := OrderedCollection new.
	globalPermanentCards := OrderedCollection new.