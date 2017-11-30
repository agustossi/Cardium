as yet unclassified
removeRandomCardFromDeckOf: aPlayer
	| cards |
	cards:=playersDecks at: aPlayer.
	cards remove: ( cards at: ((Random new) nextInt: (cards size) ) )