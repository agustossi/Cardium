accessing
isWinner: aPlayer	
	| positionsHistory lastIndex |
	positionsHistory:=playerPositions at: (aPlayer).
	lastIndex:= positionsHistory size. 	
   (((positionsHistory at: lastIndex) rounds) >= rounds) ifTrue: [ state := Ended new. winner:=aPlayer ]