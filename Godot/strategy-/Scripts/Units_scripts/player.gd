class_name Player extends Unit

func stats() -> Array:
	var health: int = 300
	var move_speed: int = 5
	var damage: int = 7
	var first_attack: String = "Mell" 
	var unit_type: String = "Player"
	
	return [health, move_speed, damage, first_attack, second_attack, unit_type]
