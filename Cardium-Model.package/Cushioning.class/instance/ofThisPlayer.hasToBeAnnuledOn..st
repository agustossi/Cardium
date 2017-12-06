action
ofThisPlayer: aPlayer hasToBeAnnuledOn: aGame	
	(state last) removeFromGlobalDeckOfThis: aGame thisCard: self.
	
	