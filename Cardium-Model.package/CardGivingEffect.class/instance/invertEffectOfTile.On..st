action
invertEffectOfTile: aTile On: aGame 
	| anInvertedCardGivingEffect |
	anInvertedCardGivingEffect := InvertedCardGivingEffect new.
	aGame boardAtPosition: aTile put: anInvertedCardGivingEffect