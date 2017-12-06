tests
testNameShouldntBeEmpty
	self
		should: [ Player named: '' calculatingDeckWith: (DeckRandomGenerator new) ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'The name shouldnt be empty' ]