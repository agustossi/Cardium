action
undoTheLastPlayOn: aGame of: aPlayer 
	| timeMachine |
	timeMachine:= TimeMachineEffect new.
	timeMachine appliesEffectTo: aPlayer on: aGame.
	aGame addLastTile: (UndoEffect new).