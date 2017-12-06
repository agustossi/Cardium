action
applyPermanentEffectsOn: aPlayer withThisThrow: diceThrow
	| cards |
	cards := aPlayer cardsAffectingHim.
	^ cards
		inject: diceThrow
		into: [ :start :card | card appliesEffectOn: start ]