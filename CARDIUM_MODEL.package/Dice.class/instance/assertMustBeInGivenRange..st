initialization
assertMustBeInGivenRange: aValue
	(aValue > faces or: aValue <= 0)
		ifTrue: [ Error signal: 'Incorrect Value' ]