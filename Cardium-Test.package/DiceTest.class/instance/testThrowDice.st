tests
testThrowDice	
	
	| diceNum dice |
	dice:= Dice faces: 8.
	diceNum:= dice faceValue.	
	self assert: (diceNum between: 1 and: dice numberOfFaces).