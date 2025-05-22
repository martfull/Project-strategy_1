class_name Main_Unit extends Unit

signal unit_clicked(unit)

func stats() -> Dictionary:
	return {
		"health": 300,
		"move_speed": 7,
		"evasion": 10,
		
		"attack1_type": "None",
		"attack2_type": "None",
		"damage1": 10,
		"damage2": 1,
		"number_attacks1": 2,
		"number_attacks2": 0,
		"name_attack1": "Meel",
		"name_attack2": "None",
		
		"texture": "res://sprites/peasant-attack1.png",
		"unit_type": "Main_Unit"
	}


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("unit_clicked", self)
