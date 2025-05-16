extends Node2D
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused: 
			resume_game()
		else: pause_game()
		
func resume_game():
	$PauseMenu.visible = false 	
	
func pause_game():
	$PauseMenu.visible = true 	
	
	

func _on_button_pressed() -> void:
	resume_game()


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("B:/Satoru/Project-strategy/Godot/strategy-/Scenes/test_menu.tscn")
