as yet unclassified
invertEffectOfTile: aTile On: aGame 
	| anInvertedWormholeEffect |
	anInvertedWormholeEffect := InvertedWormholeEffect new.
	aGame boardAtPosition: aTile put: anInvertedWormholeEffect.