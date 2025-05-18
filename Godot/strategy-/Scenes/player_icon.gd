extends TextureRect

func _ready():
	visible = false
	print("222")
	
func is_player():
	visible = true	
	
func not_player():
	visible = false
