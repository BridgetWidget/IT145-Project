class_name EPinkBullet extends "res://Assets/Scripts/EBullet.gd"
#Yash



func PinkBullet(body, bob):
	if body.is_in_group("player"):
		if (((Game.player.is_on_floor() == false) && (Game.player.build_mode == true))):
			bob.queue_free()
			Game.player.velocity.y = Game.player.JUMP_VELOCITY/1.5
		else:
			Game.player.position.y  = 0
			Game.player.position.x  = 0
		print(Game.player.is_on_floor())
		print(Game.player.build_mode)
	if body != get_parent():
		pass
