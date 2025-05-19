extends Node
@export var unit_scene: PackedScene = preload("res://Scenes/main_unit.tscn")

func _ready() -> void:
	spawn_unit(Vector2(0, 0))
	
	
func spawn_unit(pos: Vector2):
	var unit = unit_scene.instantiate() as Main_Unit
	unit.position = pos
	add_child(unit)
	var stats = unit.stats()
	unit.initialise(stats[0], stats[1], stats[2], stats[3], stats[4], stats[5], stats[6])
	$"../UI/MainUI/TextureRect/hp_bar".setHP(unit.health, stats[0])
	$"../UI/MainUI/TextureRect/mp_bar".setMP(unit.move_speed, stats[1])
	$"../UI/MainUI/TextureRect/player_icon".activate_icon(stats[5])
	
	print(unit.stats_now())
	
