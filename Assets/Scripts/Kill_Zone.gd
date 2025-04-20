#NE Kills you when you go under de map
extends Area2D
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_body_entered(body):
	print("you died")
	timer.start()


func _on_timer_timeout():
	Game.Death += 1
	get_tree().reload_current_scene()
