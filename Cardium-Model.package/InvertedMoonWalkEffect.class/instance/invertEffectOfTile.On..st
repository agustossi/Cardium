as yet unclassified
invertEffectOfTile: aTile On: aGame 
	| aMoonWalkEffect |
	aMoonWalkEffect := MoonWalkEffect new.
	aGame boardAtPosition: aTile put: aMoonWalkEffect.