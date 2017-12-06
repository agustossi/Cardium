action
applyPermanentEffectsOn: aPlayer withThisThrow: diceThrow
	| cards |
	cards := aPlayer cardsAffectingPlayer.
	^ cards inject: diceThrow into: [ :start :card | card appliesEffectOn: start ]