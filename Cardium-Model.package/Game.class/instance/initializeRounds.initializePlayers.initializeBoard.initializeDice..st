initialization
initializeRounds: aRound initializePlayers: somePlayers initializeBoard: aBoard initializeDice: aDice
	rounds := aRound.
	players := somePlayers.
	board := aBoard.
	dice := aDice.
	state := 'Active'.
	playerIndex := 1.
	positionCalculator:= PositionCalculator new.
	playerPositions := Dictionary new.
	self playersPositionInizialization.