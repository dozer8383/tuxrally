extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed() -> void:
	var file = FileAccess.open("user://save.dat", FileAccess.WRITE)
	file.store_string(str(0))
	get_tree().paused = false
	get_tree().reload_current_scene()
