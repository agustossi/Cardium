as yet unclassified
invertEffectOfTile: aTile On: aGame 
	| anInvertedSpeedUp |
	anInvertedSpeedUp := InvertedSpeedUpEffect new.
	aGame boardAtPosition: aTile put: anInvertedSpeedUp.