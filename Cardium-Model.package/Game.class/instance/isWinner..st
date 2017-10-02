accessing
isWinner: aPlayer	
	
	(((playerPositions at: (aPlayer name)) rounds) >= rounds) ifTrue: [ state := 'Ended'. winner:=aPlayer ]