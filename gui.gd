extends Control

func _process(delta: float) -> void:
	if globals.neckSnapped:
		visible = false
