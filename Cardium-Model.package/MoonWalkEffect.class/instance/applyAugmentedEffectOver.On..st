affecting
applyAugmentedEffectOver: aPlayer On: aGame 
	| players onlyAffectThisPlayers |
	players := aGame players.
	onlyAffectThisPlayers := players copyWithout: aPlayer.
	onlyAffectThisPlayers do:[:player| aGame move: player tiles: -3]