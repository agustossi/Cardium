tests
testThrowDiceReturnSix	
	
	| dice |
	dice:= Dice faces: 6.
	dice setValue: 6.
	self assert: dice faceValue equals: 6.
