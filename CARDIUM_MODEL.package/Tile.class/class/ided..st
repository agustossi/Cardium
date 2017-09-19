instance creation
ided: anID

	anID isInteger ifFalse:[ Error signal: 'ID shouldnt be empty' ].
	^ self new initializeID: anID