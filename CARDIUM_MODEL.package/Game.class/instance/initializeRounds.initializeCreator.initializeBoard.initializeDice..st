initialization
initializeRounds: aRound initializeCreator: aCreator initializeBoard: aBoard initializeDice: aDice
	
	rounds:=aRound.
	player:= OrderedCollection new.
	player add: aCreator.
	board:=aBoard.
	dice:=aDice.
	state:= 'Active'.
	playerIndex:=1.