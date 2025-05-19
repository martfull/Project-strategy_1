class_name Unit extends CharacterBody2D

var health: int = 100
var move_speed: int = 1
var evasion: int = 10
var attack1_type: String = "None"
var attack2_type: String = "None"
var damage1: int = 1
var damage2: int = 1
var name_attack1: String = "None"
var number_attacks1: int = 1
var number_attacks2: int = 1
var name_attack2: String = "None"
var texture: String = "None"
var unit_type: String = "None"

func initialise(health: int = 0, move_speed: int= 0, damage: int= 0, first_attack: String = "None", 
second_attack: String = "None",texture: String = "None", unit_type: String = "None"):
	self.health = health
	self.move_speed = move_speed
	self.damage = damage
	self.first_attack = first_attack
	self.second_attack = second_attack
	self.texture = texture
	self.unit_type = unit_type

func stats_now():
	var stats = [self.health, self.move_speed, self.damage, self.first_attack, self.second_attack, self.texture, self.unit_type]
	return stats
	
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

	

	
	
