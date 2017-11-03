as yet unclassified
playerHistoryOf: aPlayer updatedWith: movesToBeMade 
	
	| positionsHistory lastIndex currentPosition |
	positionsHistory := playerPositions at:(aPlayer name).	
	"lastIndex := positionsHistory size.
	currentPosition:= positionsHistory at: lastIndex. "
	currentPosition := (self positionOf: aPlayer).
	positionsHistory add:( positionCalculator calculateNewPositionUsing:  currentPosition inThis: board havingThisNew: 	movesToBeMade). 