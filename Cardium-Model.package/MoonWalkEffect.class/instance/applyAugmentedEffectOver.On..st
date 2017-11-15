action
applyAugmentedEffectOver: aPlayer On: aGame 
	| players onlyAffectThisPlayers |
	players := aGame players.
	onlyAffectThisPlayers := players select: [:item | item ~= aPlayer  ].
	onlyAffectThisPlayers do:[:player| aGame move: player tiles: -3]