affecting
appliesEffectTo: aPlayer on: aGame 
	| players board onlyAffectThisPlayers cushioningFactor |
	players := aGame players.
	board:= aGame board.
	onlyAffectThisPlayers := self dontAffectThisPlayer: aPlayer fromThis: players.	
	cushioningFactor := aGame cushioningFactor.
	onlyAffectThisPlayers  do:[:player| aGame move: player tiles: ((-3/cushioningFactor)ceiling)]
	
	