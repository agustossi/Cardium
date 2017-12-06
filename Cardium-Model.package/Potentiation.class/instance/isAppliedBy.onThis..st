action
isAppliedBy: aPlayer onThis: aGame 
	aPlayer assertHisDeckHas: self.
	aPlayer removeFromDeck: self.	
	self appliesCardEffectOn: aGame.