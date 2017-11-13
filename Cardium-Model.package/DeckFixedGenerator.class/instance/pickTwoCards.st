as yet unclassified
pickTwoCards
   | cards |
   cards := OrderedCollection new.
	1 to: 2 do: [:index | cards add:(cardsToBeUsed at: 1)].
	^ cards.