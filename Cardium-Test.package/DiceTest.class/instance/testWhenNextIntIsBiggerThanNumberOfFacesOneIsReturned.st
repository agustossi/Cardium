tests
testWhenNextIntIsBiggerThanNumberOfFacesOneIsReturned
	
	| dice generator |	
	generator := FixedNumberGenerator startFrom:5.
	dice:= Dice faces: 6 rollingFrom: generator.	
	self assert: dice faceValue equals: 6.
	self assert: dice faceValue equals: 1.