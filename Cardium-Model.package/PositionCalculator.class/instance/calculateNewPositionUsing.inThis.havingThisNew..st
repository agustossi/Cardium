as yet unclassified
calculateNewPositionUsing: currentPosition inThis: aBoard havingThisNew: position

	| boardSize newPositionValue |
	boardSize := aBoard numberOfTiles.
	newPositionValue := position + currentPosition.
	newPositionValue%boardSize==0 ifTrue:[^ 1]		
	ifFalse:[^ (newPositionValue % boardSize)] 


   

    