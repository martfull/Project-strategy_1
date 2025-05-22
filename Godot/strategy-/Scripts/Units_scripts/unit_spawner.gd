extends Node
@export var unit_scene: PackedScene = preload("res://Scenes/main_unit.tscn")
var units = [] 
var selected_unit


func _ready() -> void:
	spawn_unit(Vector2(0, 0))
	
	
func spawn_unit(pos: Vector2):
	var unit = unit_scene.instantiate() as Main_Unit
	unit.position = pos
	add_child(unit)
	unit.initialise(unit.stats())
	$"../UI/PlayerUI/MainUI/TextureRect/hp_bar".setHP(unit.health, unit.stats()["health"])
	$"../UI/PlayerUI/MainUI/TextureRect/mp_bar".setMP(unit.move_speed, unit.stats()["move_speed"])
	$"../UI/PlayerUI/MainUI/TextureRect/player_icon".activate_icon(unit.stats()["texture"])
	
	print(unit.stats_now())
	unit.unit_clicked.connect(_on_unit_clicked) # Підключаємо сигнал тут
	units.append(unit)
	


func _on_unit_clicked(unit):
	selected_unit = unit
	update_ui_with_selected_unit()
	
func update_ui_with_selected_unit():
	var stats = selected_unit.stats()
	var hp_res = taken_damage(selected_unit.health, 20, stats["health"])
	if hp_res > 0:
		selected_unit.health = hp_res
		$"../UI/PlayerUI/MainUI/TextureRect/hp_bar".setHP(selected_unit.health, stats["health"])
		$"../UI/PlayerUI/MainUI/TextureRect/mp_bar".setMP(selected_unit.move_speed, stats["move_speed"])
		$"../UI/PlayerUI/MainUI/TextureRect/player_icon".activate_icon(stats["texture"])
		print("работае")
	else:
		pass 

func _on_button_pressed() -> void:
	spawn_unit(Vector2(255,144))
	
	
func die(health):
	if health <= 0:
		print("есть пробитие")		
		return true	
	else:
		return false
		
func set_die():
	selected_unit.queue_free()
		
	
func taken_damage(hp: int, damage: int, max_hp: int):
	hp -= damage
	if die(hp) == false:
		print("не почуствовав")
		$"../UI/PlayerUI/MainUI/TextureRect/hp_bar".setHP(hp, max_hp)
		return hp
	else: 
		set_die()
		return 0
	
func use_mp(mp:int, cost: int, max_mp):
	mp -= cost
	if mp >= 0:
		$"../UI/PlayerUI/MainUI/TextureRect/mp_bar".setMP(mp, max_mp)		
		return(mp)
	else:
		print ("cant move")
