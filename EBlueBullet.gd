class_name EBlueBullet extends "res://EBullet.gd"

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# version for blue bullet
func BBoooob(body, nip):
	if body.is_in_group("player"):
		if ((Game.player.velocity.x != 0) || (Game.player.velocity.y != 0)):
			nip.queue_free()
	if body != get_parent():
		pass
