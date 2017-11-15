action
undoTheLastPlayOn: aGame of: aPlayer 
	| players onlyAffectThisPlayers timeMachine |
	players := aGame players.
	onlyAffectThisPlayers := players select: [:item | item ~= aPlayer  ].
	timeMachine := TimeMachine new.
	onlyAffectThisPlayers do: [:player | timeMachine appliesEffectTo: player on: aGame].
	aGame addLastTile: (UndoTileHandler new).