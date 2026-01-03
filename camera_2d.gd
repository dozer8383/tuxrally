extends Camera2D

@onready var player = get_node("../Car")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position.x += (player.position.x - position.x)/20
	if position.x-player.position.x > 300:
		position.x = player.position.x+300
	elif position.x-player.position.x < 100:
		position.x = player.position.x+100
	else:
		pass
	position.y = player.position.y-140
