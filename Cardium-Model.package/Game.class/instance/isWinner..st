testing
isWinner: aPlayer	
	| currentPosition|
	currentPosition := self positionOf: aPlayer.
   ((currentPosition rounds) >= rounds) ifTrue: [ state := Ended new. winner:=aPlayer ]