# NE && CB This is a modified bullet to shoot different children bullets

extends Area2D
#class_name MyBaseClass
@export var speed = 100  # Increase speed if necessary
@onready var animated_sprite_2d = $AnimatedSprite2D

var bullettype
var Bullet_object
var rng = RandomNumberGenerator.new()
var Type_of_bullet = floor(randf_range(1.0 , 3.99)) #= rng.randf_range(1, 3)
var direc = 1

func _ready():
	set_as_top_level(true)
	if Type_of_bullet == 1.0:# Make switch statements
		animated_sprite_2d.play("pink")
		Bullet_object = EPinkBullet.new()
	if Type_of_bullet == 2.0:
		animated_sprite_2d.play("default")
	if Type_of_bullet == 3.0:
		animated_sprite_2d.play("blue")
		Bullet_object = EBlueBullet.new()
		
	
func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta * direc  # Move in the correct direction
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_bullet_body_entered(body):
	if body.is_in_group("tile"):
		self.queue_free()
	if body.is_in_group("bullet"):
		self.queue_free
		body.queue_free()
	elif Type_of_bullet == 1:
		Bullet_object.PinkBullet(body,$".")
	elif Type_of_bullet == 2:
		NormalBullet(body)
	elif Type_of_bullet == 3:
		Bullet_object.BlueeBullet(body,$".")
# if sprite is = to blagh blagh and blagh it calls different boobs
		
func NormalBullet(body):
	if body.is_in_group("player"):
		self.queue_free()
		Game.Death += 1
		get_tree().reload_current_scene()
	if body != get_parent():
		queue_free()
