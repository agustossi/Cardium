action
invertEffectOfTile: aTile On: aGame 
	| aCardGivingEffect |
	aCardGivingEffect := CardGivingEffect new.
	aGame boardAtPosition: aTile put: aCardGivingEffect  
	