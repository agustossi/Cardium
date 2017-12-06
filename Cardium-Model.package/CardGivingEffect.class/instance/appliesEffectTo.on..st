affecting
appliesEffectTo: aPlayer on: aGame 
	aPlayer addToDeck: ((aGame deck) removeLast)
	