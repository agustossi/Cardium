tests
testWormholeTileEffectAppliedToThisSetOfPlayersIsWorking

	| aWormholeTile aPosition |
	aWormholeTile := Wormhole new.
	aPosition:= Position create.	
	self assert: aPosition rounds equals: 0.
	self assert: aPosition tile equals:0.
	aPosition := aWormholeTile appliesEffectOn: aPosition.
	aPosition updateRoundsOnABoardOf: 20.
	self assert: aPosition rounds equals: -1.
	self assert:  aPosition tile equals:-4.