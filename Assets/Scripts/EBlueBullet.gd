#NE child of the enemy Bullet that doesnt hit you if yur standing still
class_name EBlueBullet extends "res://Assets/Scripts/EBullet.gd"
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# version for blue bullet
func BlueeBullet(body, bob):
	if body.is_in_group("player"):
		if ((Game.player.velocity.x != 0) || (Game.player.velocity.y != 0)):
			bob.queue_free()
			get_tree().reload_current_scene()
	if body != get_parent():
		pass
