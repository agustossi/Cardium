tests
testThrowDiceReturnFour	
	
	| dice |
	dice:= Dice faces: 6.
	dice setValue: 4.
	self assert: dice faceValue equals: 4.
