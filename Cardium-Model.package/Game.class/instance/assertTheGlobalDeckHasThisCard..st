asserting
assertTheGlobalDeckHasThisCard: aCard 
	 globalPermanentCards indexOf: aCard ifAbsent: [ GameError signal: 'Global doesnt have this card' ].
	^true.