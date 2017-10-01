tests
testThrowDiceReturnOne	
	
	| dice |
	dice:= Dice faces: 3.
	dice setValue: 1.
	self assert: dice faceValue equals: 1.
