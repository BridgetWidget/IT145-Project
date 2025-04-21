# Christian burke, nathanael early, Bridget Reynolds, yash
# Prof Bancroft
# due 4/13 and 4/20

# bridget expands upon the movement system by adding cyotetime grace period
extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var Jump = false
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var label: Label = $Control/Label

var can_coyote_jump = false

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	Game.player = self
	label.text = "Deaths: " + str(Game.Death)
	
func _physics_process(delta):
	Game.player = self
	# Add the gravity.
	if (not is_on_floor()) && (can_coyote_jump == false):
		velocity.y += gravity * delta
	#BR 4/10/25 - player wont fall during coyote time
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor() || can_coyote_jump:
			velocity.y = JUMP_VELOCITY
			if can_coyote_jump:
				can_coyote_jump = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("runleft", "runright")
	
	# NE-Flipthe Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

# play some funky animations baby
	if direction ==0 :
		animated_sprite_2d.play("Idle")
	else:
		animated_sprite_2d.play("Run")

	#BR - variable for coyote time
	var was_on_floor = is_on_floor()

	move_and_slide()
	
	#BR - after moving, check if was on ground and currently isn't; start coyote time
	if was_on_floor && !is_on_floor() && velocity.y >=0 :
		can_coyote_jump = true
		coyote_timer.start()
	
func Get_velocityx():
	return(velocity.x)
func Get_velocityy():
	return(velocity.y)
func _input(event):
	if event.is_action_pressed("Jump"):
		Jump = true
		Game.player.Jump = true
	if event.is_action_released("Jump"):
		Jump = false
		Game.player.Jump = false

func _on_coyote_timer_timeout():
	can_coyote_jump = false
