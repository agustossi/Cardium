affecting
applyAugmentedEffectOver: aPlayer On: aGame
	| players |
	players := aGame players.
	(players copyWithout: aPlayer)
		do: [ :player | aGame move: player tiles: -3 ]