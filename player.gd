extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY/4
	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Horizontal movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# --- Animation logic ---
	if direction != 0:
		anim.play("walk")
		anim.flip_h = direction < 0   # flip when going left
	else:
		anim.play("idle")
		
	if not is_on_floor():
		anim.play("jump")
		

		
		

			

		
		
		
