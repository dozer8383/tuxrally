extends Label

@onready var car = get_node("../../Car")
@onready var level = get_node("../../Level/Line2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(car.position)
