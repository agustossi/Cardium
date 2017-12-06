testing
isAppliedBy: aPlayer toCancel: aCard onThis: aGame
	aPlayer assertHisDeckHas: self.
	aGame assertTheGlobalDeckHasThisCard: aCard.
	aPlayer removeFromDeck: self.
	aCard ofThisPlayer: aPlayer hasToBeAnnuledOn: aGame.