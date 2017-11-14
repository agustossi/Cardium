initialization
initializeRounds: aRound initializePlayers: somePlayers initializeBoard: aBoard initializeDice: aDice initializeDeck: deckGenerator
	rounds := aRound.
	players := somePlayers.
	board := aBoard.
	dice := aDice.
	state := Active new.
	playerIndex := 1.
	positionCalculator := PositionCalculator new.
	playerPositions := Dictionary new.
	playersDecks := Dictionary new.
	cardsAffectingPlayers := Dictionary new.
	deck := OrderedCollection new.
	self initializeDeckWithThisGenerator: deckGenerator.
	self playersPositionInizialization.
	self playersDecksInizialization: deckGenerator.
	self cardsAffectingPlayersInitialization.
	tileHandler := OrderedCollection new.
	cardHandler := OrderedCollection new.