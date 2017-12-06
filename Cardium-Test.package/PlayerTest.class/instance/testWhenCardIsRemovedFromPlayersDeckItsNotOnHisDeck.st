tests
testWhenCardIsRemovedFromPlayersDeckItsNotOnHisDeck
	| agus aSpeedCard |
	agus := Player named: 'agustina' calculatingDeckWith: (DeckRandomGenerator new).
	aSpeedCard := Speed new.
	agus addToDeck: aSpeedCard.
	agus removeFromDeck: aSpeedCard.
	self should: [ agus assertHisDeckHas: aSpeedCard ] raise: GameError withExceptionDo: [ :signal | self assert: signal messageText equals: 'Player doesnt have this card' ]