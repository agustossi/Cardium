affecting
appliesEffectTo: aPlayer on: aGame 
	(aGame deckSizeOf: aPlayer) > 0 ifTrue: [ aGame removeRandomCardFromDeckOf: aPlayer ].