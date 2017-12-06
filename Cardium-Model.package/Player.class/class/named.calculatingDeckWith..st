instance creation
named: aName calculatingDeckWith: deckGenerator
	self assertShouldNotBeEmpty: aName.
	^ self new initializePlayerNamed: aName withThis: deckGenerator