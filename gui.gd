extends CanvasLayer

@onready var car = get_node("../Car")
@onready var meterometer = get_node("MeterMeter")

var highestDistance = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var currentDistance: int = round(car.position.x/50)
	if currentDistance > highestDistance:
		highestDistance = currentDistance
	meterometer.text = str(highestDistance)+" m"


func _on_car_game_over() -> void:
	if highestDistance > globals.bestDistance:
		globals.bestDistance = highestDistance
		var file = FileAccess.open("user://save.dat", FileAccess.WRITE)
		file.store_string(str(globals.bestDistance))
