extends RigidBody2D

@onready var neckSpring = get_node("../DampedSpringJoint2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (rotation > 1 or rotation < -1) and not globals.neckSnapped:
		rotation = 0
		position = Vector2(-8,-21)
	if globals.neckSnapped:
		neckSpring.stiffness = 3
		neckSpring.damping = 0.03
