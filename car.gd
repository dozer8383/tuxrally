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
	#var moving = false
	if Input.is_action_pressed("moveRight"):
		#moving = true
		apply_torque_impulse(-100*enginePower*leanPower)
		if frontwheel.angular_velocity < maxWheelSpeed: frontwheel.apply_torque_impulse(100*enginePower)
		if backwheel.angular_velocity < maxWheelSpeed: backwheel.apply_torque_impulse(100*enginePower)
	if Input.is_action_pressed("moveLeft"):
		#moving = true
		apply_torque_impulse(100*enginePower*leanPower)
		if frontwheel.angular_velocity < maxWheelSpeed: frontwheel.apply_torque_impulse(-100*enginePower)
		if backwheel.angular_velocity < maxWheelSpeed: backwheel.apply_torque_impulse(-100*enginePower)


func _on_head_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()
