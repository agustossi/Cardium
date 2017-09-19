tests
testThrowDiceReturnFive
	
	
	| dice |
	dice:= Dice faces: 6.
	dice setValue: 5.
	self assert: dice faceValue equals: 5.
