action
isAppliedBy: aPlayer toProtect: aCard onThis: aGame 
	aPlayer assertHisDeckHas: self.
	aGame assertTheGlobalDeckHasThisCard: aCard.
	aPlayer removeFromDeck: self.	 
	aCard protected.