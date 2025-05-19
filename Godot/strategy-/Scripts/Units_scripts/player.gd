class_name Main_Unit extends Unit

func stats() -> Array:
	var health: int = 300
	var move_speed: int = 5
	var damage: int = 7
	var first_attack: String = "Mell"
	var texture: String = "res://sprites/peasant-attack1.png"
	var unit_type: String = "Main_Unit"
	
	return [health, move_speed, damage, first_attack, second_attack, texture, unit_type]
