action
thePlayer: aPlayer applies: anAnnulment toCancel: aCard effectOnPlayer: aTarget
	| anAnnulmentEffect |
	self assertThePlayer:aTarget effectingDeckHasThis: aCard.
	self assertThePlayers: aPlayer deckHasThis: anAnnulment.
	self remove: anAnnulment fromDeckOf: aPlayer.
	self remove: aCard fromAffectingDeckOf: aTarget.
	anAnnulmentEffect := AnnulmentEffect onPlayer: aTarget toCancel: aCard.
	
	allCardsUsed add: anAnnulmentEffect.
	lastPlay := allCardsUsed.
	