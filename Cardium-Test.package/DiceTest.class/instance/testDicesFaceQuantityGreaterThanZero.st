tests
testDicesFaceQuantityGreaterThanZero
	
	 self should: [ Dice faces: 0 ] raise:  Error.

