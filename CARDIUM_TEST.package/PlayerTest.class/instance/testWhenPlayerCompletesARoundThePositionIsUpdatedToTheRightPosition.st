tests
testWhenPlayerCompletesARoundThePositionIsUpdatedToTheRightPosition
		
	| player |
	player:= Player named: 'Player1'.
	player moveForward: 6 onABoardOf: 4.
	self assert: player tile equals: 2.
	
	
	
	