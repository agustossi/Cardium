tests
testThrowDiceReturnTwo	
	
	| dice |
	dice:= Dice faces: 6.
	dice setValue: 2.
	self assert: dice faceValue equals: 2.
