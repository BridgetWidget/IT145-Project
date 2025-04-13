extends CharacterBody2D

@export var speed = 130
@export var flip = false
var move = Vector2(speed,0)
@onready var tile_map = get_parent().get_node("TileMap")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction =1
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta * speed
	position.x += delta * direction
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

