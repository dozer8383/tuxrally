extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if not Input.is_action_pressed("special"):
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("moveLeft", "moveRight")
		
		if direction:
			velocity.x = move_toward(velocity.x, direction * SPEED, SPEED*0.1)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED*0.1)

		move_and_slide()
	else:
		if Input.is_action_pressed("jump"):
			position.y -= 40
		if Input.is_action_pressed("moveDown"):
			position.y += 40
		
		var direction := Input.get_axis("moveLeft", "moveRight")
		
		if direction:
			position.x += 40*direction
