action
thePlayer: aPlayer applies: aCard 
	self assertThePlayers: aPlayer deckHasThis: aCard.
	self remove: aCard  fromDeckOf: aPlayer.
	aCard appliesCardEffectOn: self.