actions
throwDice
	| randomNumber |
	randomNumber:= Random new.
	^ (randomNumber nextInt: faces)