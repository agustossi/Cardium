tests
testWhenIAskForPlayerNameIsReturned
	
	| player |
	player := Player named: 'pepe'.
	self assert: player name equals: 'pepe'
	
	