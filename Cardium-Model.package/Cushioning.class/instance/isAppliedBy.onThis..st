action
isAppliedBy: aPlayer onThis: aGame 
	aGame assertIsTheTurnOf: aPlayer.
	aPlayer assertHisDeckHas: self.
	aPlayer removeFromDeck: self.	
	aGame addGlobalPermanentCard: self.