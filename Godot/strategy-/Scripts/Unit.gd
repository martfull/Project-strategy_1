class_name Unit extends CharacterBody2D
var health: int = 100
var move_speed: int = 4
var damage: int = 5
var unit_type: String = "UNType"

func initialise(health: int = 0, move_speed: int= 0, damage: int= 0, unit_type: String = "None"):
	self.health = health
	self.move_speed = move_speed
	self.damage = damage
	self.unit_type = unit_type

func stats_now():
	var stats = [self.health, self.move_speed, self.damage, self.unit_type]
	return stats
