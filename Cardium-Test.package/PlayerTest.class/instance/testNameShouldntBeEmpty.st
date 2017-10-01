tests
testNameShouldntBeEmpty
	
	self should:  [ Player named: '' ] raise: Error.
	
	
	
	