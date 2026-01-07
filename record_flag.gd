extends Sprite2D

@onready var bestLabel = get_node("Label")
@onready var level = get_node("../Level/Line2D")
@onready var car = get_node("../Car")
@onready var camera = get_node("../Camera2D")

func setup() -> void:
	if globals.bestDistance > 0:
		position.x = globals.bestDistance*50
		bestLabel.text = "Best: "+str(globals.bestDistance)+" m"
		show()
		
func _physics_process(delta: float) -> void:
	position.y = camera.position.y+100
