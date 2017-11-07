tests
testDicesFaceQuantityGreaterThanZero
	
	 self should: [ Dice faces: 0 ] raise:  GameError withExceptionDo: [:signal | self assert: signal messageText equals: 'The number of faces should be greater than 0']..

