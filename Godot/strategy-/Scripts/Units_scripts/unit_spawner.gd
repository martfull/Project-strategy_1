extends Node
@export var unit_scene: PackedScene = preload("res://Scenes/main_unit.tscn")
var units = [] 
var players = []
var current_player: Player
var selected_unit
var checked_unit
var second_selected_unit
var hp_bar
var mp_bar
var player_icon
var gold
var income

func _ready() -> void:
	hp_bar = $"../player/UI/PlayerUI/MainUI/TextureRect/hp_bar"
	mp_bar = $"../player/UI/PlayerUI/MainUI/TextureRect/mp_bar"
	player_icon = $"../player/UI/PlayerUI/MainUI/TextureRect/player_icon"
	gold = $"../player/UI/PlayerUI/MainUI/TextureRect/gold_amount"
	income = $"../player/UI/PlayerUI/MainUI/TextureRect/income_amount"
	
	var player = Player.new()
	player.team = 1
	current_player = player
	players.append(player)
	player_ui()
	spawn_unit(Vector2(0, 0))
	
	
	
func spawn_unit(pos: Vector2):	
	var unit = unit_scene.instantiate() as Main_Unit
	unit.position = pos
	add_child(unit)
	unit.initialise(unit.stats())
	unit.team = current_player.team
	selected_unit = unit
	update_ui_with_selected_unit()
	print(unit.stats_now())
	unit.unit_clicked.connect(_on_unit_clicked) 
	units.append(unit)
	


func _on_unit_clicked(unit):
	checked_unit = unit
	if checked_unit.team == current_player.team:
		selected_unit = checked_unit
		update_ui_with_selected_unit()
	
func update_ui_with_selected_unit():
	hp_bar.setHP(selected_unit.health, selected_unit.stats()["health"])
	mp_bar.setMP(selected_unit.move_speed,selected_unit.stats()["move_speed"])
	player_icon.activate_icon(selected_unit.stats()["texture"])
	


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
	hp_bar.setHP(0, 0)
	mp_bar.setMP(0, 0)	
	player_icon.not_player()
	
func taken_damage(hp: int, damage: int, max_hp: int):
	hp -= damage
	if die(hp) == false:
		print("не почуствовав")
		hp_bar.setHP(hp, max_hp)
		return hp
	else: 
		set_die()
		return -1
		
func attack():
	pass
	
func use_mp(mp:int, cost: int, max_mp):
	mp -= cost
	if mp >= 0:
		mp_bar.setMP(mp, max_mp)		
		return(mp)
	else:
		print ("cant move")
		return -1
		
func player_ui():
	gold.set_gold(current_player.gold)
	income.set_income(current_player.income) 
	
