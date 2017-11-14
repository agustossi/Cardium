action
applyPermanentEffectsOn: aPlayer withThisThrow: diceThrow 
	| cards finalNumber value |
	cards:= cardsAffectingPlayers at: aPlayer.
	value:=diceThrow.
	finalNumber:= cards do: [ :card | value:=card appliesEffectOn: value ].
	^ value.