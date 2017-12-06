action
invertEffectOfTile: aTile On: aGame 
	| aSpeedUpEffect |
	aSpeedUpEffect := SpeedUpEffect new.
	aGame boardAtPosition: aTile put: aSpeedUpEffect.