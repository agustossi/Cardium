testing
isWinner: aPlayer	
	| currentPosition|
	currentPosition := self positionOf: aPlayer.
   ((currentPosition rounds) >= rounds) ifTrue: [ state := GameEnded withWinner: aPlayer ]