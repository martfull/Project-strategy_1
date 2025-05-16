extends Node
class Actor:
	pass
	
class Tile:
	var x: int
	var y: int
	func _init(x: int, y: int):
		self.x = x
		self.y = y
	
	func is_free() -> bool:
		return false
		
	func get_actor() -> Actor:
		return
		
	func set_actor(actor:Actor):
		return 


var cords = Tile.new(1,1)
func _ready() -> void:
	print(cords.x, cords.y)
