extends Label

func _ready() -> void:
	var file = FileAccess.open("user://save.dat", FileAccess.READ)
	if file != null:
		globals.bestDistance = int(file.get_as_text())
		text = "Best: "+str(globals.bestDistance)+" m"
