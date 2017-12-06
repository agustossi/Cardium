action
invertEffectOfTile: aTile On: aGame 
	| aWormholeEffect |
	aWormholeEffect := WormholeEffect new.
	aGame boardAtPosition: aTile put: aWormholeEffect.