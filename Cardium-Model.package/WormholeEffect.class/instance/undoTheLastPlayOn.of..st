action
undoTheLastPlayOn: aGame of: aPlayer
	TimeMachineEffect new appliesEffectTo: aPlayer on: aGame.
	aGame addLastTile: UndoEffect new