accessing
position: movesToBeMade
	
	| currentPlayer actualPosition newTiles newPosition |
	currentPlayer := players at: playerIndex.
	actualPosition := playerPositions at: (currentPlayer name).	
	newTiles := (actualPosition sumOfTiles) + movesToBeMade.
	newPosition:= Position withThisSumOfTiles: newTiles.
	newPosition updateRoundsOnABoardOf: (board numberOfTiles).
	^ newPosition.
	