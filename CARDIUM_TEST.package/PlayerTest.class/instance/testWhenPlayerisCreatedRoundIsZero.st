tests
testWhenPlayerisCreatedRoundIsZero
		
	| player |
	player:= Player named: 'Player  loquillo'.	
	self assert: player rounds equals:0.
	
	
	
	