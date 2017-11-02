initialization
initializeRounds: aRound initializePlayers: somePlayers initializeBoard: aBoard initializeDice: aDice
	rounds := aRound.
	players := somePlayers.
	board := aBoard.
	dice := aDice.
	state := 'Active'.
	playerIndex := 1.
	playerPositions:= Dictionary new.	
	players do: [:player | playerPositions at:(player name) put: (Position moving: 0 from: 0 onABoardOf: (board numberOfTiles )) ]