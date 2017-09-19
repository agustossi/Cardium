tests
testWhenSizeIsZeroOrLowerAnErrorOccurs
	
	self should: [ Board ofSize: 0 ] raise: Error.