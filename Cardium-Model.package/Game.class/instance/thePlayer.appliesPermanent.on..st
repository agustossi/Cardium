as yet unclassified
thePlayer: aPlayer appliesPermanent: aCard on: aTarget
    self assertIsTheTurnof: aPlayer.
    self assertThePlayersDeckHasThis: aCard.
	