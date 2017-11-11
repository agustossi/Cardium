initialization
nextInt: aNumberOfFaces
	(self resetRollValue: aNumberOfFaces).
	rollValue := rollValue + 1.
	^ rollValue