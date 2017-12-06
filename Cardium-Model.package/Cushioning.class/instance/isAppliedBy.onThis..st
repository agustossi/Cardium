action
isAppliedBy: aPlayer onThis: aGame 
	aGame assertIsTheTurnOf: aPlayer.
	aPlayer assertHisDeckHas: self.
	aGame addGlobalPermanentCard: self.
	aPlayer removeFromDeck: self.