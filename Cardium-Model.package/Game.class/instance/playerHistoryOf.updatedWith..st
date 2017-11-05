as yet unclassified
playerHistoryOf: aPlayer updatedWith: movesToBeMade 
	
	| positionsHistory lastIndex currentPosition |
	positionsHistory := playerPositions at:(aPlayer).		
	currentPosition := (self positionOf: aPlayer).
	positionsHistory add:( positionCalculator calculateNewPositionUsing:  currentPosition inThis: board havingThisNew: 	movesToBeMade). 