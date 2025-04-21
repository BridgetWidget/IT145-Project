#NE A child of the enemy bullet that you can pary if you are in the air and holding space

class_name EPinkBullet extends "res://Assets/Scripts/EBullet.gd"
#Yash


func PinkBullet(body, father):
	if body.is_in_group("player"):
		if (((Game.player.is_on_floor() == false) && (Game.player.Jump == true))):
			father.queue_free()
			Game.player.velocity.y = Game.player.JUMP_VELOCITY#/1.5
		else:
			Game.Death += 1
			body.get_tree().reload_current_scene()
		print(Game.player.is_on_floor())
		print(Game.player.Jump)
	if body != get_parent():
		pass
