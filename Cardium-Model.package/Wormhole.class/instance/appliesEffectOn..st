as yet unclassified
appliesEffectOn: aPosition 
	
	| sum newPosition |
	sum := aPosition sumOfTiles - 4.
	newPosition:=Position withThisSumOfTiles: sum.
	^ newPosition.