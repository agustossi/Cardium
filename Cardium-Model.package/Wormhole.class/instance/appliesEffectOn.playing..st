as yet unclassified
appliesEffectOn: playersPosition playing: aPlayer 
	
	| sum newPosition aPosition |
	aPosition:= playersPosition at: (aPlayer name).
	sum := aPosition sumOfTiles - 4.
	newPosition:=Position withThisSumOfTiles: sum.
	playersPosition at: (aPlayer name) put: newPosition.