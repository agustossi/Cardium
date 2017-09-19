tests
testThrowDiceReturnThree	
	
	| dice |
	dice:= Dice faces: 6.
	dice setValue: 3.
	self assert: dice faceValue equals: 3.
