tests
testWhenCardIsRemovedFromPlayersAffectingDeckItsNotOnHisAffectingDeck
	| agus aSpeedCard |
	agus := Player named: 'agustina' calculatingDeckWith: (DeckRandomGenerator new).
	aSpeedCard := Speed new.
	agus addOnAffectingDeck: aSpeedCard.
	agus removeFromAffectingDeck: aSpeedCard.
	self should: [ agus assertHisAffectingDeckHas: aSpeedCard ] raise: GameError withExceptionDo: [ :signal | self assert: signal messageText equals: 'Player isnt being affected by this card' ]