class_name EBlueBullet extends "res://EBullet.gd"

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# version for blue bullet
func BlueeBullet(body, bob):
	if body.is_in_group("player"):
		if ((Game.player.velocity.x != 0) || (Game.player.velocity.y != 0)):
			bob.queue_free()
			Game.player.position.x = -63
			Game.player.position.y = -10
	if body != get_parent():
		pass
