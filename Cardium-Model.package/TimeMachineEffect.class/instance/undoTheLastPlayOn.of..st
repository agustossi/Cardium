action
undoTheLastPlayOn: aGame of: aPlayer 
	
	self appliesEffectTo: aPlayer on: aGame.
	aGame addLastTile: (UndoEffect new).