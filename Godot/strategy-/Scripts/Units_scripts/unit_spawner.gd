extends Node
@export var unit_scene: PackedScene = preload("res://Scenes/main_unit.tscn")

func _ready() -> void:
	spawn_unit(Vector2(0, 0))
	
	
func spawn_unit(pos: Vector2):
	var unit = unit_scene.instantiate() as Main_Unit
	unit.position = pos
	add_child(unit)
	unit.initialise(unit.stats())
	$"../UI/MainUI/TextureRect/hp_bar".setHP(unit.health, unit.stats()["health"])
	$"../UI/MainUI/TextureRect/mp_bar".setMP(unit.move_speed, unit.stats()["move_speed"])
	$"../UI/MainUI/TextureRect/player_icon".activate_icon(unit.stats()["texture"])
	
	print(unit.stats_now())
	unit.health = 29
	print(unit.stats_now())	
