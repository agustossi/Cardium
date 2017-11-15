action
thePlayer: aPlayer appliesPermanent: aCard on: aTarget
	self assertIsTheTurnof: aPlayer.
	self assertThePlayers: aPlayer deckHasThis: aCard.
	self add: aCard onEffectingCardsTo: aTarget.
	self remove: aCard fromDeckOf: aPlayer