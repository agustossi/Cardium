tests
testDiceCreatedWithFixedGeneratorReturnsOne
	
	
	| dice generator |	
	generator := FixedNumberGenerator startFrom:0.
	dice:= Dice faces: 6 rollingFrom: generator.	
	self assert: dice faceValue equals: 1.
