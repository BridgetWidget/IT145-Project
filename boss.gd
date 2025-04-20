extends Node2D

@onready var gun: Sprite2D = $Gun
@onready var ticker: Timer = $Ticker
@onready var big_boy_move: Timer = $BigBoyMove
@onready var forehead: Marker2D = $Sprite2D/Forehead
@onready var sprite_2d: Sprite2D = $Sprite2D

""" 
func pew_pew():
	ploob = (0 - 200+tick)
	look_at(Vector2(0,ploob))
	var bullet_inst = bull.instantiate()
	bullet_inst.rotation = (rotation + randf_range(-0.1, 0.1))
	bullet_inst.direc = 1 
	bullet_inst.scale.x = 1
	bullet_inst.global_position = forehead.global_position
	self.add_child(bullet_inst)
	big_boy_move.start()
	tick += 1
	"""

var tick = 0
var ploob
var time = false
var bull = load("res://Assets/Scenes/bossbullet.tscn")
func _ready():
	ticker.start()
func pew_pew():
	var sweep_y = -200 + (tick * 20)
	var wave_frequency = .09
	var wave_amplitude = .5
	
	var wave_offset = sin(tick * wave_frequency) * wave_amplitude
	var shoot_angle = deg_to_rad(0) + wave_offset
	var bullet_inst = bull.instantiate()
	bullet_inst.rotation = shoot_angle
	bullet_inst.direc = 1
	bullet_inst.scale.x = 1
	bullet_inst.global_position = forehead.global_position
	get_tree().current_scene.add_child(bullet_inst)
	tick += 1
	big_boy_move.start()
	if tick > 100:
		tick = 0

func _physics_process(delta):
	if time == true:
		big_boy_move.start()
	else:
		big_boy_move.stop()

func _on_big_boy_move_timeout() -> void:
	pew_pew()
	# add to our tick so we can figure out the hight of the bullets starting shooting place
	# start timer to stop the shooting

func _on_ticker_timeout() -> void:
	#if cloc kis started turn of if nt then turn on
	if big_boy_move.time_left > 0:
		time = false
		ticker.wait_time = 5.0
		tick = 0
	else:
		time = true
		ticker.wait_time = 10.0
