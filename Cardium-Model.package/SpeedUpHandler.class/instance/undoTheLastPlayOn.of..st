as yet unclassified
undoTheLastPlayOn: aGame of: aPlayer 
	| timeMachine |
	timeMachine := TimeMachine new.
	timeMachine appliesEffectTo: aPlayer on: aGame