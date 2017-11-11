initialization
assertMustBeInGivenRange: aValue
	(aValue > faces or: aValue <= 0)
		ifTrue: [ GameError signal: 'Incorrect Value' ]