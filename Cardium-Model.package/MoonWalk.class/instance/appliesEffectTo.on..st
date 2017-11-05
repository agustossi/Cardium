as yet unclassified
appliesEffectTo: aPlayer on: aGame 
	| players board onlyAffectThisPlayers|
	players := aGame players.
	board:= aGame board.
	onlyAffectThisPlayers := self dontAffectThisPlayer: aPlayer fromThis: players.	
	onlyAffectThisPlayers  do:[:player| aGame playerHistoryOf: player updatedWith: -3]
	
	