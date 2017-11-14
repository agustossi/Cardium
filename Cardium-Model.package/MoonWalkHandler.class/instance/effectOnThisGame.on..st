action
effectOnThisGame: aGame on: aPlayer 
	| players onlyAffectThisPlayers |
	players := aGame players.
	onlyAffectThisPlayers := players select: [:item | item ~= aPlayer  ].
	onlyAffectThisPlayers do:[:player| aGame move: player tiles: -3]