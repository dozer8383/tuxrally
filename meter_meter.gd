extends Label

@onready var car = get_node("../../Car")
var highestDistance = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var currentDistance = round(car.position.x/10)/10
	if currentDistance > highestDistance:
		highestDistance = currentDistance
	text = str(highestDistance)+" m"
