affecting
appliesEffectTo: aPlayer on: aGame 
	| players onlyAffectThisPlayers cushioningFactor |
	players := aGame players.
	onlyAffectThisPlayers := players copyWithout: aPlayer.	
	cushioningFactor := aGame cushioningFactor.
	onlyAffectThisPlayers  do:[:player| aGame move: player tiles: ((3/cushioningFactor)ceiling)]