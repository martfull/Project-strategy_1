extends Node2D

@export var TrueRed_or_FalseBlue:bool = true

@onready var red = $unit/team_red
@onready var blue = $unit/team_blue

func _process(delta):
	if TrueRed_or_FalseBlue == true:
		red.visible = true   
		blue.visible = false  
	else:
		red.visible = false  
		blue.visible = true   
