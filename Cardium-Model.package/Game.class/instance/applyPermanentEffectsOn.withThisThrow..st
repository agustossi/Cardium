action
applyPermanentEffectsOn: aPlayer withThisThrow: diceThrow
	| cards |
	cards := cardsAffectingPlayers at: aPlayer.
	^ cards
		inject: diceThrow
		into: [ :start :card | card appliesEffectOn: start ]