extends TileMapLayer

func _input(event):
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Отримуємо позицію миші відносно TileMapLayer
		var mouse_pos = get_local_mouse_position()
		# Перетворюємо позицію миші в координати тайла
		var tile_coords = local_to_map(mouse_pos)
		
		
		print(tile_coords)
