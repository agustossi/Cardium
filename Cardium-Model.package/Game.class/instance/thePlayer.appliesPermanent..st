action
thePlayer: aPlayer appliesPermanent: aCard
	self assertIsTheTurnof: aPlayer.
	self assertThePlayers: aPlayer deckHasThis: aCard.
	globalPermanentCards add: aCard.
	self remove: aCard fromDeckOf: aPlayer