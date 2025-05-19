extends TextureRect

	
func activate_icon(path: String):
	visible = true	
	texture = load(path)

func not_player():
	visible = false
