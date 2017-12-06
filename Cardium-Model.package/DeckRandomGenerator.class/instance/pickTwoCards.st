initialization
pickTwoCards
	| cards |
	cards:=OrderedCollection new.
	
	cards add: (cardsToPick atRandom).
	cards add: (cardsToPick atRandom).
	^ cards