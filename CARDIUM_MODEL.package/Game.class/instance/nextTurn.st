action
nextTurn
	| currentPlayer movesToBeMade |
	self assertGameIsNotEnded.
	currentPlayer := players at: playerIndex.
	movesToBeMade := 0.
	1 to: dice size do:
		[ :index | movesToBeMade := movesToBeMade + (dice at: index) faceValue ].
	currentPlayer
		moveForward: movesToBeMade
		onABoardOf: board numberOfTiles.
	playerIndex - self numberOfPlayers == 0
		ifTrue: [ playerIndex := 1 ]
		ifFalse: [ playerIndex := playerIndex + 1 ].
	self winner: currentPlayer