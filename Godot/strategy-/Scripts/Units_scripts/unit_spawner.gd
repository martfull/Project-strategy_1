extends Node
@export var unit_scene: PackedScene = preload("res://Scenes/main_unit.tscn")

func _ready() -> void:
	spawn_unit(Vector2(0, 0))
	
	
func spawn_unit(pos: Vector2):
	var unit = unit_scene.instantiate() as Main_Unit
	unit.position = pos
	add_child(unit)
	var stats = unit.stats()
	unit.initialise(
		stats["health"],
		stats["move_speed"],
		stats["evasion"],
		
		stats["attack1_type"],
		stats["attack2_type"],
		stats["damage1"],
		stats["damage2"],
		stats["number_attacks1"],
		stats["number_attacks2"],
		stats["name_attack1"],
		stats["name_attack2"],
		
		stats["texture"],
		stats["unit_type"]
	)
	$"../UI/MainUI/TextureRect/hp_bar".setHP(unit.health, stats["health"])
	$"../UI/MainUI/TextureRect/mp_bar".setMP(unit.move_speed, stats["move_speed"])
	$"../UI/MainUI/TextureRect/player_icon".activate_icon(stats["texture"])
	
	print(unit.stats_now())
	unit.health = 29
	print(unit.stats_now())	
