as yet unclassified
appliesEffectTo: aPlayer on: aGame 
	| players board onlyAffectThisPlayers cushioningFactor |
	players := aGame players.
	board:= aGame board.
	onlyAffectThisPlayers := players select: [:item | item ~= aPlayer  ].	
	cushioningFactor := aGame cushioningFactor.
	onlyAffectThisPlayers  do:[:player| aGame move: player tiles: ((3/cushioningFactor)ceiling)]