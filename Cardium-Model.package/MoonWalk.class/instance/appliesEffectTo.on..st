affecting
appliesEffectTo: aPlayer on: aGame 
	| players board onlyAffectThisPlayers|
	players := aGame players.
	board:= aGame board.
	onlyAffectThisPlayers := self dontAffectThisPlayer: aPlayer fromThis: players.	
	onlyAffectThisPlayers  do:[:player| aGame move: player tiles: -3]
	
	