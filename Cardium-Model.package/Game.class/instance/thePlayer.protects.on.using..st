action
thePlayer: aPlayer protects: aCard on: aTarget using: aProtectionCard
	| aProtectionEffect |
	self assertThePlayers: aPlayer deckHasThis: aProtectionCard.
	self assertThePlayer: aTarget effectingDeckHasThis: aCard.	
	self remove: aProtectionCard fromDeckOf: aPlayer.
	aCard protected.
	"aProtectionEffect := ProtectionEffect onPlayer: aTarget toProtect: aCard.
	allCardsUsed add: aProtectionEffect.
	lastPlay := allCardsUsed."