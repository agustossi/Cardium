tests
testPositionCreationIsSuccessful

	| position |
	position:= Position create.
	self assert: position tile equals: 0.
	self assert: position rounds equals: 0.