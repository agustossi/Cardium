action
dontAffectThisPlayer: aPlayer fromThis: players
	
	| subSetOfPlayers |
	subSetOfPlayers := players select: [:item | item ~= aPlayer  ].
	^ subSetOfPlayers.