affecting
appliesEffectTo: aPlayer on: aGame 
	| onlyAffectThisPlayers cushioningFactor |
	onlyAffectThisPlayers := (aGame players) copyWithout: aPlayer.
	cushioningFactor := aGame cushioningFactor.
	onlyAffectThisPlayers  do:[:player| aGame move: player tiles: ((-3/cushioningFactor)ceiling)]
	
	