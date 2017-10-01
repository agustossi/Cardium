tests
testEffectlesTileEffectAppliedToThisPlayerIsWorking

	| anEffectlesTile aPosition |
	anEffectlesTile := Effectles new.
	aPosition:= Position create.	
	self assert: aPosition rounds equals: 0.
	self assert: aPosition tile equals:0.
	anEffectlesTile appliesEffectOn: aPosition.
	self assert: aPosition rounds equals: 0.
	self assert: aPosition tile equals:0.