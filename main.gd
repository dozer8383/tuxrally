extends Node2D

func _ready() -> void:
	$Level.genLevel()
	$RecordFlag.setup()
