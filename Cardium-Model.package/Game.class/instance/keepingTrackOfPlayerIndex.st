action
keepingTrackOfPlayerIndex
	playerIndex - self numberOfPlayers == 0
		ifTrue: [ playerIndex := 1 ]
		ifFalse: [ playerIndex := playerIndex + 1 ]