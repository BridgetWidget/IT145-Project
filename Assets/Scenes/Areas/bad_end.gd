extends Node2D
const rick = preload("res://Assets/Music/Rick Astley - Never Gonna Give You Up (Official Music Video).mp3")

func _ready():
	
	Music.set_stream(rick)
	Music.play()
