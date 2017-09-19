tests
testThrowDice	
	
	| diceNum dice |
	dice:= Dice faces: 8.
	diceNum:= dice throwDice.
	self assert: (diceNum between: 1 and: dice numberOfFaces).