extends Node
@export var unit_scene: PackedScene = preload("res://Scenes/player.tscn")

func _ready() -> void:
	spawn_unit(Vector2(0, 0))
	
	
func spawn_unit(pos: Vector2):
	var unit = unit_scene.instantiate() as Player
	unit.position = pos
	add_child(unit)
	var stats = unit.stats()
	unit.initialise(stats[0], stats[1], stats[2], stats[3], stats[4], stats[5])
	$"../UI/MainUI/TextureRect/hp_bar".setHP(unit.health)
	$"../UI/MainUI/TextureRect/player_icon".is_player()
	print(unit.stats_now())
	
