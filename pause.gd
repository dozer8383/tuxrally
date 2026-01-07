extends Control

@onready var tree = get_tree()
@onready var gui = get_node("..")

func _process(delta: float) -> void:
	if globals.neckSnapped:
		visible = false

func _on_pause_button_pressed():
	tree.paused = true
	show()

func _on_continue_button_pressed():
	tree.paused = false
	hide()

func _on_new_level_button_pressed() -> void:
	if gui.highestDistance > globals.bestDistance:
		globals.bestDistance = gui.highestDistance
		var file = FileAccess.open("user://save.dat", FileAccess.WRITE)
		file.store_string(str(globals.bestDistance))
	tree.paused = false
	hide()
	get_tree().reload_current_scene()

func _on_load_seed_button_pressed() -> void:
	globals.randomSeed = int(DisplayServer.clipboard_get())
	globals.doNotPickSeed = true
	tree.paused = false
	hide()
	get_tree().reload_current_scene()
