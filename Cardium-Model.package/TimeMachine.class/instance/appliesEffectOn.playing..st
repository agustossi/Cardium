as yet unclassified
appliesEffectOn: playersPosition playing: aPlayer 
		
	| actualPosition |
	
	actualPosition:= playersPosition at:(aPlayer name).
	
	Transcript show: actualPosition lastTiles.
	
	(actualPosition lastTiles == 0) ifTrue: [playersPosition at:(aPlayer name) put:(Position create)]
	ifFalse: [ playersPosition at:(aPlayer name) put:(Position withThisSumOfTiles: 
		(actualPosition lastTiles))].