action
isAppliedBy: aPlayer toCancel: aCard onThis: aGame 
	aPlayer assertHisDeckHas: self.
	aGame assertGlobalAffectingCardsHasThis: aCard.
	aPlayer removeFromDeck: self.
	aGame removeGlobalPermanentCard.