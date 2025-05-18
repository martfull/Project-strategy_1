extends Node
@export var unit_scene: PackedScene = preload("res://Scenes/player.tscn")

func _ready() -> void:
	spawn_unit(Vector2(0, 0))
	
	
func spawn_unit(pos: Vector2):
	var unit = unit_scene.instantiate() as Player
	unit.position = pos
	add_child(unit)
	var stats = unit.stats()
	unit.initialise(stats[0], stats[1], stats[2], stats[3])
	print(unit.stats_now())
	
