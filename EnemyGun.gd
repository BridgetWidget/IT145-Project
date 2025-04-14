#Christian made this
extends Sprite2D
@onready var timer_2: Timer = $Gun/Timer2
@onready var player = get_tree().current_scene.get_node('Player')
@onready var enemy_2: CharacterBody2D = $".."
@onready var gun: Sprite2D = $"."

var slippy = 1
var florp = true
var can_fire = true
var bullet = load("res://bulletenemy.tscn")
#var players = 

func _ready():
	set_as_top_level(false)
func _physics_process(delta):

	if global_position.distance_to(Game.player.global_position) < 600:
		look_at(Game.player.global_position)
	if can_fire:
		var bullet_instance = bullet.instantiate()
		if (florp == true):
			bullet_instance.rotation = (rotation + randf_range(-0.1, 0.1)) * slippy
			bullet_instance.direc = 1 
			bullet_instance.scale.x = 1
		else:
			bullet_instance.rotation = (rotation + randf_range(-0.1, 0.1)) * slippy
			bullet_instance.direc = -1 
			bullet_instance.scale.x = -1# botoom correct top worng = -1
		bullet_instance.global_position = $muzzle.global_position
		self.add_child(bullet_instance)

func Set_slippy(slorp):
	slippy = slorp
