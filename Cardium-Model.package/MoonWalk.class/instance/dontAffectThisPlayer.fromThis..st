as yet unclassified
dontAffectThisPlayer: aPlayer fromThis: players
	
	| subSetOfPlayers |
	subSetOfPlayers := players select: [:item | item ~= aPlayer  ].
	^ subSetOfPlayers.