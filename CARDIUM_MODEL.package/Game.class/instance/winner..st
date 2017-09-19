accessing
winner: aPlayer	
	
	(aPlayer rounds >= rounds) ifTrue: [ state := 'Ended'. winner:=aPlayer ]