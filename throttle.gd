extends RigidBody2D

const carbody = get_node()

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var moving = false
	if Input.is_action_pressed("moveRight"):
		moving = true
		apply_torque_impulse(300)
	if Input.is_action_pressed("moveLeft"):
		moving = true
		apply_torque_impulse(-300)
