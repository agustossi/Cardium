action
undoTheLastPlayOn: aGame of: aPlayer 
	| timeMachine players |
	players:= aGame players.
	timeMachine:= TimeMachineEffect new.
	players do: [:player | timeMachine appliesEffectTo: player on: aGame].
	aGame addLastTile: (UndoEffect new).