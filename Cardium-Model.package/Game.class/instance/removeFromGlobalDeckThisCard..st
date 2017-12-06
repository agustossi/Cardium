removing
removeFromGlobalDeckThisCard: aCard 
	globalPermanentCards remove: aCard ifAbsent:[GameError signal:'Card is absent']. 