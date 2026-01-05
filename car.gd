extends RigidBody2D

@onready var frontWheel = get_node("./GrooveJoint2D/Wheel")
@onready var backWheel = get_node("./GrooveJoint2D2/Wheel2")
@onready var head = get_node("./Head")
@onready var grassBack = get_node("./GrassBackWheel")
@onready var grassFront = get_node("./GrassFrontWheel")
@export var enginePower: float = 3
@export var maxWheelSpeed = 30
@export var leanPower: float = 0.7

signal gameOver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var inAir = 0
	var frontWheelOnGround = false
	var backWheelOnGround = false
	for body in frontWheel.get_colliding_bodies():
		if body.is_in_group("Ground"): frontWheelOnGround = true
	for body in backWheel.get_colliding_bodies():
		if body.is_in_group("Ground"): backWheelOnGround = true
	if not frontWheelOnGround and not backWheelOnGround:
		inAir = 1
	if frontWheelOnGround and (Input.is_action_pressed("moveRight") or Input.is_action_pressed("moveLeft")) and not globals.neckSnapped:
		grassFront.emitting = true
	else:
		grassFront.emitting = false
	if backWheelOnGround and (Input.is_action_pressed("moveRight") or Input.is_action_pressed("moveLeft")) and not globals.neckSnapped:
		grassBack.emitting = true
	else:
		grassBack.emitting = false
	if Input.is_action_pressed("moveRight") and not globals.neckSnapped:
		apply_torque_impulse(-100*enginePower*leanPower*(inAir+1))
		if frontWheel.angular_velocity < maxWheelSpeed: frontWheel.apply_torque_impulse(100*enginePower)
		if backWheel.angular_velocity < maxWheelSpeed: backWheel.apply_torque_impulse(100*enginePower)
	if Input.is_action_pressed("moveLeft") and not globals.neckSnapped:
		apply_torque_impulse(100*enginePower*leanPower*(inAir+1))
		if frontWheel.angular_velocity < maxWheelSpeed: frontWheel.apply_torque_impulse(-100*enginePower)
		if backWheel.angular_velocity < maxWheelSpeed: backWheel.apply_torque_impulse(-100*enginePower)

func _on_head_body_entered(body: Node) -> void:
	if body.is_in_group("Ground"):
		globals.neckSnapped = true
		gameOver.emit()
		await get_tree().create_timer(3.0).timeout
		globals.neckSnapped = false
		get_tree().reload_current_scene()
