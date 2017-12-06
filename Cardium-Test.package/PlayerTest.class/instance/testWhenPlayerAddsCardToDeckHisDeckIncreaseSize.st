tests
testWhenPlayerAddsCardToDeckHisDeckIncreaseSize
	| agus |
	agus := Player named: 'agustina' calculatingDeckWith: (DeckRandomGenerator new).
	self assert: (agus deckSize ) equals: 2.
	agus addToDeck: (Speed new).
	self assert: (agus deckSize) equals: 3.