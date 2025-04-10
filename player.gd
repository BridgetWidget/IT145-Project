extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var can_coyote_jump = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


	
func _physics_process(delta):
	# Add the gravity.
	#BR 4/10/25 - player wont fall during coyote time
	if (not is_on_floor()) && (can_coyote_jump == false):
		velocity.y += gravity * delta

	# Handle Jump.
	#BR 4/10/25 - added coyote jump handling
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor() || can_coyote_jump:
			velocity.y = JUMP_VELOCITY
			if can_coyote_jump:
				can_coyote_jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("runleft", "runright")
	
	# Flipthe Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#BR - variable for coyote time
	var was_on_floor = is_on_floor()

	move_and_slide()
	
	#BR - after moving, check if was on ground and currently isn't; start coyote time
	if was_on_floor && !is_on_floor() && velocity.y >=0 :
		can_coyote_jump = true
		coyote_timer.start()

#BR - when coyote timer ends, cannot jump
func _on_coyote_timer_timeout():
	can_coyote_jump = false
