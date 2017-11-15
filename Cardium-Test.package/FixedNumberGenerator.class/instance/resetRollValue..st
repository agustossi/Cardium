initialization
resetRollValue: aNumberOfFaces
	(rollValue == aNumberOfFaces)
		ifTrue: [ rollValue := 0 ]