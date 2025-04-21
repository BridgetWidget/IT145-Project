#Christian made this
extends Sprite2D
@onready var progress_bar_2: ProgressBar = $"../Control/ProgressBar2"

#CB Shoots bullets for player
var can_fire = true
var bullet = load("res://Assets/Scenes/Bullet.tscn")
func _ready():
	set_as_top_level(false)
func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	if Input.is_action_just_pressed("fire") and can_fire:
		var bullet_instance = bullet.instantiate()
		bullet_instance.rotation = rotation + randf_range(-0.1, 0.1)
		bullet_instance.global_position = $muzzle.global_position
		get_parent().add_child(bullet_instance)
		can_fire = false
		progress_bar_2.value = 0 
func _on_timer_timeout() -> void:
	progress_bar_2.value += 5
	if progress_bar_2.value == 100:
		can_fire = true
	

	
