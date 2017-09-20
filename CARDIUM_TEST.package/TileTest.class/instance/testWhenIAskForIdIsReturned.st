tests
testWhenIAskForIdIsReturned
	
	| tile |
	tile := Tile ided: 1.
	self assert: tile id equals: 2.