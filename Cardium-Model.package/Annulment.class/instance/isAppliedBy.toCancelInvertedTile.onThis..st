action
isAppliedBy: aPlayer toCancelInvertedTile: aTile onThis: aGame 
	aPlayer assertHisDeckHas: self.
	aPlayer removeFromDeck: self.
	(aGame board tileAtPosition: aTile) assertIsInverted.
	(aGame board tileAtPosition: aTile) invertEffectOfTile: aTile On: aGame.