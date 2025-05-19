class_name Unit extends CharacterBody2D

var health: int = 100
var move_speed: int = 4
var damage: int = 5
var first_attack: String = "None"
var second_attack: String = "None"
var texture: String = "None"
var unit_type: String = "None"

func initialise(health: int = 0, move_speed: int= 0, damage: int= 0, first_attack: String = "None", second_attack: String = "None",texture: String = "None", unit_type: String = "None"):
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
		pass
		
func taken_damage(hp: int, damage: int):
	hp -= damage
	return hp
	
func use_mp(mp:int, cost: int):
	mp -= cost
	return(mp)
	

	

	
	
