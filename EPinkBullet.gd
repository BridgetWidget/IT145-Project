class_name EPinkBullet extends "res://EBullet.gd"




func PBoooob(body, nip):
	if body.is_in_group("player"):
		if (((Game.player.is_on_floor() == false) && (Game.player.build_mode == true))):
			nip.queue_free()
		print(Game.player.is_on_floor())
		print(Game.player.build_mode)
	if body != get_parent():
		pass
