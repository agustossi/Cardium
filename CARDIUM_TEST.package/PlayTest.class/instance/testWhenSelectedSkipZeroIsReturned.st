tests
testWhenSelectedSkipZeroIsReturned
	
	| play |
	play:= SkipTurn new.	
	self assert: play code equals:0.