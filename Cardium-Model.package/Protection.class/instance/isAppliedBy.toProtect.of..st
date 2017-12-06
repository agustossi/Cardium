action
isAppliedBy: aPlayer toProtect: aCard of: aTarget 
	aPlayer assertHisDeckHas: self.
	aTarget assertHisAffectingDeckHas: aCard.	
	aPlayer removeFromDeck: self.	
	aCard protected.