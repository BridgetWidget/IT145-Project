#Christian and nathan The enemys gun. also an evolution of the normal gun
extends Sprite2D
@onready var player = get_tree().current_scene.get_node('Player')
@onready var enemy_2: CharacterBody2D = $".."
@onready var gun: Sprite2D = $"."
@onready var timer_2: Timer = $Timer2


var invert = 1
var flipped = true
var can_fire = true
var bullet = load("res://Assets/Scenes/bulletenemy.tscn")
#var players = 
func _ready():
	set_as_top_level(false)
func _physics_process(delta):
	if global_position.distance_to(Game.player.global_position) < 600:
		look_at(Game.player.global_position)
	if can_fire:
		var bullet_instance = bullet.instantiate()
		if (flipped == true):
			bullet_instance.rotation = (rotation + randf_range(-0.1, 0.1)) * invert
			bullet_instance.direc = 1 
			bullet_instance.scale.x = 1
		else:
			bullet_instance.rotation = (rotation + randf_range(-0.1, 0.1))* invert
			bullet_instance.direc = -1 
			bullet_instance.scale.x = -1# botoom correct top worng = -1
		bullet_instance.global_position = $muzzle.global_position
		self.add_child(bullet_instance)
		can_fire = false# turn this back to false later
		timer_2.start()

func Set_Inv(flips):
	invert = flips


func _on_timer_2_timeout() -> void:
	can_fire = true
