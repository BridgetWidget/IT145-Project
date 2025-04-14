extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var apple = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# reloading

		
		
	# Get the imput direction -1 0 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flipthe Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Play animation
	if is_on_floor():
		if Input.is_action_just_pressed("reload") and apple:
			animated_sprite.stop()
			animated_sprite.play("switchO-B")
			apple = false
		elif Input.is_action_just_pressed("reload") and !apple:
			animated_sprite.stop()
			animated_sprite.play("switchB-O")
			apple = true
		elif direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("jump")
	# Apply movement

	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
