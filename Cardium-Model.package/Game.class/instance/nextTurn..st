action
nextTurn: aPlayer
	| movesToBeMade |
	self assertGameIsNotEnded.
	self assertIsTheTurnof: aPlayer.
	movesToBeMade := 0.
	movesToBeMade := dice sumNumbers: [ :d | d faceValue ].	
	playerPositions at: aPlayer name put: (self position: movesToBeMade).	
	self keepingTrackOfPlayerIndex.
	self isWinner: aPlayer