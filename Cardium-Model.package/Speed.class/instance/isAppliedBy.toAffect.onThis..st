action
isAppliedBy: aPlayer toAffect: aTarget onThis: aGame 
	aGame assertIsTheTurnOf: aPlayer.
	aPlayer assertHisDeckHas: self.
	aTarget addOnAffectingDeck: self.
	aPlayer removeFromDeck: self.