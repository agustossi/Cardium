action
invertEffectOfTile: aTile On: aGame
	aGame boardAtPosition: aTile put: (InvertedWormholeEffect new)