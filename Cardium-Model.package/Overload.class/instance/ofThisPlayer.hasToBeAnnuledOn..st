initialization
ofThisPlayer: aPlayer hasToBeAnnuledOn: aGame	
	(state last) doTo: aPlayer on: aGame card:self.
	state removeLast.
	