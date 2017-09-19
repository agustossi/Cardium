action
nextTurn
	
	| currentPlayer movesToBeMade tiles |
	currentPlayer:= player at: playerIndex.
	movesToBeMade:=0.
	1 to: (dice size) do: [ :index | movesToBeMade:= movesToBeMade + ((dice at:index) faceValue) ].
	currentPlayer moveForward: movesToBeMade onABoardOf: (board numberOfTiles).
	((playerIndex - (self playedBy) )== 0) ifTrue: [ playerIndex:= 1 ] ifFalse:  [ playerIndex:= playerIndex + 1 ].
	self winner: currentPlayer.