extends Area2D

@export var speed = 100  # Increase speed if necessary
#CB Bullet for the player
var bullettype

func _ready():
	set_as_top_level(true)
	#put some things to change sprite based on input(i want 
	#to make a function in bullet that gets called by the parent that way when you put
	# bullet inside of the enemy it can change the sprite and its corresponding damaging
	# or ability)

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta  # Move in the correct direction
# make this become a process that stupidly changes the sprite by increments of 1
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_bullet_body_entered(body):
	if body.is_in_group("tile"):
		self.queue_free
	if body.is_in_group("enemy"):
		self.queue_free
		body.queue_free()
	if body.is_in_group("bullet"):
		self.queue_free
		body.queue_free()
	if body != get_parent():
		queue_free()

func _on_enemy_bullet_area_entered(area):
	_on_bullet_body_entered(area)
