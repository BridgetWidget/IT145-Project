#BR - this script will be autoloaded and will manage transitions
extends Node


var current_area = 1
var area_path = "res://Assets/Scenes/Areas/"

func next_level():
	current_area += 1
	var full_path = area_path + "area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print("The player has moves to area " + str(current_area))
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
