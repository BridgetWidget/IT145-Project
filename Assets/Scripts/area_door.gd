#BR - creating door to switch between levels
extends Area2D

func _on_door_entered(body):
	if body is CharacterBody2D:
		GameManager.next_level()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
