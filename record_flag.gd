extends Sprite2D

@onready var level = get_node("../Level/Line2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if globals.bestDistance > 20:
		position.x = globals.bestDistance*50
		position.y = level.points[globals.bestDistance]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass


func _on_car_game_over() -> void:
	pass
