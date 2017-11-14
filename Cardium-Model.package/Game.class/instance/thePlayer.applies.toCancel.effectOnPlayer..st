action
thePlayer: aPlayer applies: anAnnulment toCancel: aCard effectOnPlayer: aTarget
	| anAnnulmentHandler |
	self assertThePlayer:aTarget effectingDeckHasThis: aCard.
	self assertThePlayers: aPlayer deckHasThis: anAnnulment.
	self remove: anAnnulment fromDeckOf: aPlayer.

	self remove: aCard fromAffectingDeckOf: aTarget.
	
	anAnnulmentHandler := AnnulmentHandler new.
	anAnnulmentHandler cancels: aCard of: aTarget. 
	cardHandler add: anAnnulmentHandler.
	lastPlay := cardHandler.