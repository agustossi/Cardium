action
positionOf: aPlayer
	| positionsHistory lastIndex |
	positionsHistory := (playerPositions at: (aPlayer name)).	
	lastIndex := positionsHistory size.	 
	^ (positionsHistory at: lastIndex ).