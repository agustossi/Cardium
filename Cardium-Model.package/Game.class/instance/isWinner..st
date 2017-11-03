accessing
isWinner: aPlayer	
	| positionsHistory lastIndex |
	positionsHistory:=playerPositions at: (aPlayer name).
	lastIndex:= positionsHistory size. 	
   (((positionsHistory at: lastIndex) rounds) >= rounds) ifTrue: [ state := 'Ended'. winner:=aPlayer ]