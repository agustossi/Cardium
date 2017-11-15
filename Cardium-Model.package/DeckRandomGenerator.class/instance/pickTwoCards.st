initialization
pickTwoCards
	| cards |
	cards:=OrderedCollection new.
	
	cards add: (cardsToPick shuffle at: 1).
	cards add: (cardsToPick shuffle at: 2).
	^ cards