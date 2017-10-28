tests
testWhenSizeIsZeroOrLowerAnErrorOccurs
	
	self should: [ Board ofSize: 0 ] raise: Error description: 'board size must be greater than 0'.