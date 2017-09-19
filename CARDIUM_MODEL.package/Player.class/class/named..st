instance creation
named: aName
	self assertShouldNotBeEmpty: aName.
	^ self new initialize: aName