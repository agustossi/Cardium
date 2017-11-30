as yet unclassified
invertEffectOfTile: aTile On: aGame 
	| anInvertedMoonWalk |
	anInvertedMoonWalk := InvertedMoonWalkEffect new.
	aGame boardAtPosition: aTile put: anInvertedMoonWalk.