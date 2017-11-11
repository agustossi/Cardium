as yet unclassified
calculateNewTileUsing: currentPosition inThis: aBoard havingThisNew: position

	| boardSize newPositionValue |
	boardSize := aBoard numberOfTiles.
	newPositionValue := position + currentPosition.
   ^ (newPositionValue % boardSize == 0 and: [ newPositionValue ~~ 0 ])
        ifTrue: [ boardSize ]
        ifFalse: [ newPositionValue % boardSize ]
	


   

    