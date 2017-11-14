action
undoTheLastPlayOn: aGame of: aPlayer 
	| timeMachine |
	timeMachine:= TimeMachine new.
	timeMachine appliesEffectTo: aPlayer on: aGame.
	aGame addLastTile: (UndoTileHandler new).