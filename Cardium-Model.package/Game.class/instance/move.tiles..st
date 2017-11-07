as yet unclassified
move: aPlayer tiles: movesToBeMade 
	
	| positionsHistory lastIndex currentPosition |
	positionsHistory := playerPositions at:(aPlayer).		
	currentPosition := (self positionOf: aPlayer).
	positionsHistory add:( positionCalculator calculateNewPositionUsing:  currentPosition inThis: board havingThisNew: 	movesToBeMade). 