accessing
position: movesToBeMade
	
	| currentPlayer actualPosition newPosition |
	currentPlayer := players at: playerIndex.
	actualPosition := playerPositions at: (currentPlayer name).	
	"newTiles := (actualPosition sumOfTiles) + movesToBeMade."
	newPosition:= Position moving: movesToBeMade from:(actualPosition sumOfTiles) onABoardOf: (board numberOfTiles).
	^ newPosition.
	