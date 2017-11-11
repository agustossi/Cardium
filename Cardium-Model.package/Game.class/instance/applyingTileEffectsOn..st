action
applyingTileEffectsOn: aPlayer
	(self positionOf: aPlayer) tiles == 0
		ifFalse: [ self tileEffectAppliedTo: aPlayer ]