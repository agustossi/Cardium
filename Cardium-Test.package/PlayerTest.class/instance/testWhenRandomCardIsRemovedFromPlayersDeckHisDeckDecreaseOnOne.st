tests
testWhenRandomCardIsRemovedFromPlayersDeckHisDeckDecreaseOnOne
	| agus aSpeedCard |
	agus := Player named: 'agustina' calculatingDeckWith: (DeckRandomGenerator new).
	aSpeedCard := Speed new.
	agus addToDeck: aSpeedCard.
	self assert: ( agus deckSize ) equals: 3.
	agus removeRandomCardFromDeck.
	self assert: ( agus deckSize ) equals: 2.