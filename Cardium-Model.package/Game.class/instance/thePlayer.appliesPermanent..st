as yet unclassified
thePlayer: aPlayer appliesPermanent: aCard 
	self assertIsTheTurnof: aPlayer.
   self assertThePlayersDeckHasThis: aCard.
   players do:[:aTarget | self add: aCard onEffectingCardsTo: aTarget.].	
	self remove: aCard fromDeckOf: aPlayer.
	