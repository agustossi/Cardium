tests
testWhenPlayerCompletesARoundRoundSumsOne
		
	| player |
	player:= Player named: 'Player1'.
	player moveForward: 6 onABoardOf: 4.
	self assert: player rounds equals: 1.
	
	
	
	