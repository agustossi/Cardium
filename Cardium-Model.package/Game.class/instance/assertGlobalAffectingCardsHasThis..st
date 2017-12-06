asserting
assertGlobalAffectingCardsHasThis: aCushioning 
	globalPermanentCards size > 0 ifFalse: [ GameError signal: 'Players arent being affected by this card' ].
	^ true.