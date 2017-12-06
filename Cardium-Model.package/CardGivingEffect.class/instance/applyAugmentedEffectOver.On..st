affecting
applyAugmentedEffectOver: aPlayer On: aGame 
	aPlayer addToDeck: ((aGame deck) removeLast).
	