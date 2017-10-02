accessing
faceValue
	|aux|
	aux:=value.	
	value:=value+1.
	value > faces ifTrue:[ value:=1].
	^ aux.
	