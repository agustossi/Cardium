as yet unclassified
appliesEffectTo: aPlayer on: aGame 
	| cushioningFactor |
	cushioningFactor := aGame cushioningFactor.
	aGame move: aPlayer tiles: ((4/cushioningFactor) ceiling).