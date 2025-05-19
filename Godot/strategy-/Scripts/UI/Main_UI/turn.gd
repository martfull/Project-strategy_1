extends Label

var a = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if text == "Red":
		add_theme_color_override("font_color" , Color.RED)
	else:
		add_theme_color_override("font_color" , Color.BLUE)
