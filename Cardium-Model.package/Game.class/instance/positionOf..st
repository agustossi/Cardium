action
positionOf: aPlayer
	| positionsHistory lastIndex |
	positionsHistory := (playerPositions at: (aPlayer)).	
	lastIndex := positionsHistory size.	 
	^ (positionsHistory at: lastIndex ).