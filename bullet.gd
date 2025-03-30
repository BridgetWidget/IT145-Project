extends Area2D

@export var speed = 100  # Increase speed if necessary

func _ready():
	set_as_top_level(true)

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta  # Move in the correct direction

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_bullet_body_entered(body):
	if is_in_group("enemy_bullet") and body.is_in_group("player"):
		body.kill()
	
	if body != get_parent():
		queue_free()

func _on_enemy_bullet_area_entered(area):
	_on_bullet_body_entered(area)
