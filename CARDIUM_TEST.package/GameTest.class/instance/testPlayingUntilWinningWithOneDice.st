tests
testPlayingUntilWinningWithOneDice

	| game seba board dice dice1 dice2 agus |
	seba:= Player named: 'sebastian'.
	board:= Board ofSize: 10.
	dice1:= Dice faces: 6.	
	dice1 setValue: 1.
	dice:= Array with: dice1.
   game := Game rounds: 1 createdBy: seba withThisBoard: board usingDice: dice.
   agus:= Player named: 'agustina'.
	game addPlayer: agus.	
	self assert:  (game positionOf: seba) tile equals:0.
	self assert: (game positionOf: agus) tile equals: 0.
	self assert:  (game positionOf: seba) rounds equals:0.
	self assert: (game positionOf: agus) rounds equals: 0.
	game nextTurn.
	self assert:  (game positionOf: seba) tile equals:1.
	self assert: (game positionOf: agus) tile equals: 0.
	self assert:  (game positionOf: seba) rounds equals:0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn.
	self assert:  (game positionOf: seba) tile equals:1.
	self assert: (game positionOf: agus) tile equals: 2.
	self assert:  (game positionOf: seba) rounds equals:0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn.
	self assert:  (game positionOf: seba) tile equals:4.
	self assert: (game positionOf: agus) tile equals: 2.
	self assert:  (game positionOf: seba) rounds equals:0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn.
	self assert:  (game positionOf: seba) tile equals:4.
	self assert: (game positionOf: agus) tile equals: 6.
	self assert:  (game positionOf: seba) rounds equals:0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn.
	self assert:  (game positionOf: seba) tile equals:9.
	self assert: (game positionOf: agus) tile equals: 6.
	self assert:  (game positionOf: seba) rounds equals:0.
	self assert: (game positionOf: agus) rounds equals: 0.
	self assert: game isActive.
	game nextTurn.
	self assert:  (game positionOf: seba) tile equals:9.
	self assert: (game positionOf: agus) tile equals: 2.
	self assert:  (game positionOf: seba) rounds equals:0.
	self assert: (game positionOf: agus) rounds equals: 1.
	self deny: game isActive.
	self assert: game winner equals: agus.