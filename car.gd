extends RigidBody2D

@onready var frontwheel = get_node("./GrooveJoint2D/Wheel")
@onready var backwheel = get_node("./GrooveJoint2D2/Wheel2")
@onready var head = get_node("./Head")
@export var enginePower: float = 3
@export var maxWheelSpeed = 30
@export var leanPower: float = 0.7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var inAir = 0
	if frontwheel.get_contact_count() == 0 and backwheel.get_contact_count() == 0:
		inAir = 1
	if Input.is_action_pressed("moveRight") and not globals.neckSnapped:
		apply_torque_impulse(-100*enginePower*leanPower*(inAir+1))
		if frontwheel.angular_velocity < maxWheelSpeed: frontwheel.apply_torque_impulse(100*enginePower)
		if backwheel.angular_velocity < maxWheelSpeed: backwheel.apply_torque_impulse(100*enginePower)
	if Input.is_action_pressed("moveLeft") and not globals.neckSnapped:
		apply_torque_impulse(100*enginePower*leanPower*(inAir+1))
		if frontwheel.angular_velocity < maxWheelSpeed: frontwheel.apply_torque_impulse(-100*enginePower)
		if backwheel.angular_velocity < maxWheelSpeed: backwheel.apply_torque_impulse(-100*enginePower)
		

func _on_head_body_entered(body: Node) -> void:
	globals.neckSnapped = true
	await get_tree().create_timer(3.0).timeout
	globals.neckSnapped = false
	get_tree().reload_current_scene()
