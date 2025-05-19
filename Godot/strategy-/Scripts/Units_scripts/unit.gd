class_name Unit extends CharacterBody2D

var health: int = 100
var move_speed: int = 1
var evasion: int = 10

var attack1_type: String = "None"
var attack2_type: String = "None"
var damage1: int = 1
var damage2: int = 1
var number_attacks1: int = 1
var number_attacks2: int = 1
var name_attack1: String = "None"
var name_attack2: String = "None"

var texture: String = "None"
var unit_type: String = "None"

func initialise(
	health: int = 0,
	move_speed: int = 0,
	evasion: int = 0,

	attack1_type: String = "None",
	attack2_type: String = "None",
	damage1: int = 1,
	damage2: int = 1,
	number_attacks1: int = 1,
	number_attacks2: int = 1,
	name_attack1: String = "None",
	name_attack2: String = "None",

	texture: String = "None",
	unit_type: String = "None"
) -> void:
	self.health = health
	self.move_speed = move_speed
	self.evasion = evasion
	
	self.attack1_type = attack1_type
	self.attack2_type = attack2_type
	self.damage1 = damage1
	self.damage2 = damage2
	self.number_attacks1 = number_attacks1
	self.number_attacks2 = number_attacks2
	self.name_attack1 = name_attack1
	self.name_attack2 = name_attack2
	
	self.texture = texture
	self.unit_type = unit_type

func stats_now() -> Dictionary:
	return {
		"health": self.health,
		"move_speed": self.move_speed,
		"evasion": self.evasion,

		"attack1_type": self.attack1_type,
		"attack2_type": self.attack2_type,
		"damage1": self.damage1,
		"damage2": self.damage2,
		"number_attacks1": self.number_attacks1,
		"number_attacks2": self.number_attacks2,
		"name_attack1": self.name_attack1,
		"name_attack2": self.name_attack2,

		"texture": self.texture,
		"unit_type": self.unit_type
	}
	
func die(health):
	if health <= 0:
		print("есть пробитие")		
		return true	
	else:
		return false
		
func set_die(unit):
	unit.queue_free()
		
	
func taken_damage(hp: int, damage: int):
	hp -= damage
	if die(hp) == false:
		print("не почуствовав")
		return hp
	else: 
		return -1
	
func use_mp(mp:int, cost: int):
	mp -= cost
	if mp >= 0:
		return(mp)
	else:
		print ("cant move")

	

	
	
