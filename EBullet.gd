extends Area2D
#class_name MyBaseClass
@export var speed = 100  # Increase speed if necessary
@onready var animated_sprite_2d = $AnimatedSprite2D
var bullettype
var booooob = 3
var BlueBullet


func _ready():
	set_as_top_level(true)
	if booooob == 1:
		animated_sprite_2d.play("pink")
	if booooob == 2:
		animated_sprite_2d.play("default")
	if booooob == 3:
		animated_sprite_2d.play("blue")
		BlueBullet = EBlueBullet.new()
		
	
	#put some things to change sprite based on input(i want 
	#to make a function in bullet that gets called by the parent that way when you put
	# bullet inside of the enemy it can change the sprite and its corresponding damaging
	# or ability)

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta  # Move in the correct direction

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_bullet_body_entered(body):
	if booooob == 1:
		CBoooob(body)
	if booooob == 2:
		animated_sprite_2d.play("default")
	if booooob == 3:
		BlueBullet.BBoooob(body)
# if sprite is = to blagh blagh and blagh it calls different boobs
		
func CBoooob(body):
	if is_in_group("enemy_bullet") and body.is_in_group("player"):
		body.kill()
	if body != get_parent():
		queue_free()
#var booooob = 2
#	if booooob == 1:
#		animated_sprite_2d.play("pink")
#	if booooob == 2:
#		animated_sprite_2d.play("default")
#	if booooob == 3:
#		animated_sprite_2d.play("blue")
#@onready var animated_sprite_2d = $AnimatedSprite2D
#
#
#
#
