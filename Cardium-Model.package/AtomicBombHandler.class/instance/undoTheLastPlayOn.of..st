action
undoTheLastPlayOn: aGame of: aPlayer 
	| timeMachine players |
	players:= aGame players.
	timeMachine:= TimeMachine new.
	players do: [:player | timeMachine appliesEffectTo: player on: aGame].
	aGame addLastTile: (UndoTileHandler new).