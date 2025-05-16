extends Node2D

# Посилання на TileMapLayer і персонажа зі сцени
@onready var tile_map_layer = $"Tilemap/Layer 1"
@onready var character = $CharacterBody2D

# Поточна позиція персонажа в координатах карти
var current_map_pos: Vector2i

func _ready():
	# Встановлюємо початкову позицію персонажа на основі його координат у світі
	current_map_pos = tile_map_layer.local_to_map(tile_map_layer.to_local(character.global_position))
	character.global_position = tile_map_layer.map_to_local(current_map_pos)

func _input(event):
	# Обробка кліку миші для вибору цільової клітинки
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_global_mouse_position()
		var local_pos = tile_map_layer.to_local(mouse_pos)
		var target_map_pos = tile_map_layer.local_to_map(local_pos)
		
		# Отримуємо сусідні клітинки поточної позиції
		var neighbors = tile_map_layer.get_surrounding_cells(current_map_pos)
		
		# Перевіряємо, чи цільова клітинка є сусідньою
		if target_map_pos in neighbors:
			move_character(target_map_pos)

func move_character(target_map_pos: Vector2i):
	# Перетворюємо координати карти в глобальні координати для руху
	var target_local_pos = tile_map_layer.map_to_local(target_map_pos)
	var target_global_pos = tile_map_layer.to_global(target_local_pos)
	
	# Створюємо анімацію для плавного переміщення персонажа
	var tween = create_tween()
	tween.tween_property(character, "global_position", target_global_pos, 0.3).set_ease(Tween.EASE_IN_OUT)
	
	# Оновлюємо поточну позицію після завершення руху
	tween.tween_callback(func(): current_map_pos = target_map_pos)
