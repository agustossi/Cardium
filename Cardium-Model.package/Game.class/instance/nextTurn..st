action
nextTurn: aPlayer
	| movesToBeMade |
	self assertGameIsNotEnded.
	self assertIsTheTurnof: aPlayer.
	movesToBeMade := 0.
	movesToBeMade := dice sumNumbers: [ :d | d faceValue ].	
	self  playerHistoryOf: aPlayer updatedWith: movesToBeMade.
	"playerPositions at: aPlayer name put: (self position: movesToBeMade).
	anEffectlesTile appliesEffectOn: game allPlayersPositions playing: seba."
	"(board tileAtPosition: ((playerPositions at: aPlayer name) tile)) appliesEffectOn: playerPositions playing:      aPlayer."
	self keepingTrackOfPlayerIndex.
	self isWinner: aPlayer