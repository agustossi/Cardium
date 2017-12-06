tests
testWhenLastCardIsRemovedFromPlayersDeckItsNoLongerOnHisDeck
	| agus aSpeedCard |
	agus := Player named: 'agustina' calculatingDeckWith: (DeckRandomGenerator new).
	aSpeedCard := Speed new.
	agus addToDeck: aSpeedCard.
	agus removeLastCardFromDeck.
	self should: [ agus assertHisDeckHas: aSpeedCard ] raise: GameError withExceptionDo: [ :signal | self assert: signal messageText equals: 'Player doesnt have this card' ]