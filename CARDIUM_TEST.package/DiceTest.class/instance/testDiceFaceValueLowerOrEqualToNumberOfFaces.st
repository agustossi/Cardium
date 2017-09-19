tests
testDiceFaceValueLowerOrEqualToNumberOfFaces
	|dice|
	dice := Dice faces:10.	
	self should: [ dice setValue: -4. ] raise:  Error.

