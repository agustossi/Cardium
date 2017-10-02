tests
testMoonWalkTileEffectAppliedToThisPlayerIsWorking

	| aMoonWalkTile aPosition |
	aMoonWalkTile := MoonWalk new.
	aPosition:= Position create.	
	self assert: aPosition rounds equals: 0.
	self assert: aPosition tile equals:0.
	aMoonWalkTile appliesEffectOn: aPosition.
	self assert: aPosition rounds equals: 0.
	self assert: aPosition tile equals:0.