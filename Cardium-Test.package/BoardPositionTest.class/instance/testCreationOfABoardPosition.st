tests
testCreationOfABoardPosition
	
	| boardPosition |
	boardPosition := BoardPosition tile:1 totalTiles: 1 round: 0.
	self assert: boardPosition tiles equals: 1;
		  assert: boardPosition rounds equals: 0;
		  assert: boardPosition totalTiles equals:1.
					 				 