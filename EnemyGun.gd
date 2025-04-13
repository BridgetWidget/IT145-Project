#Christian made this
extends Sprite2D

#@onready var progress_bar_2 = $ProgressBar2
@onready var timer_2 = $Playerfinder/Timer2
@onready var playerfinder = $Playerfinder
@onready var gun = $"."

#var can_fire = true
var bullet = load("res://bulletenemy.tscn")
#var players


func _ready():
	set_as_top_level(false)
	#players = get_parent().find_child("player")
	
func _physics_process(delta):
	_aim()
	_check_player_collision()

func _aim():
	playerfinder.target_position = to_local(Game.player.position)
	look_at(playerfinder.target_position)
	
func _check_player_collision():
	if playerfinder.get_collider() == player and timer_2.is_stopped():
		timer_2.start()
	elif playerfinder.get_collider() != player and not timer_2.is_stopped():
		timer_2.stop()

		
func _on_timer_2_timeout():
	_shoot()
	
#func _on_timer_timeout():
#	progress_bar_2.value += 1
#	if progress_bar_2.value == 60:
#		can_fire = true
func _shoot():
	#if can_fire == true:
	var bullet_instance = bullet.instantiate()
	bullet_instance.rotation = rotation + randf_range(-0.1, 0.1)
	bullet_instance.global_position = $muzzle.global_position
#	can_fire == false
