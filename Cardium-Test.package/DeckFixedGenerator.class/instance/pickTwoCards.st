initialization
pickTwoCards
	| cardsToBeReturned |
	cardsToBeReturned:= OrderedCollection new.
	cardsToBeUsed do: [ :card | cardsToBeReturned add:(card ) ].
   ^ cardsToBeReturned.

