as yet unclassified
thePlayer: aPlayer applies: anAnnulment toCancel: aCard effectOnPlayer: aTarget
	self assertThePlayer:aTarget effectingDeckHasThis: aCard.
	self assertThePlayers: aPlayer deckHasThis: anAnnulment.
	self remove: anAnnulment fromDeckOf: aPlayer.
	self remove: aCard fromAffectingDeckOf: aTarget.
	
	