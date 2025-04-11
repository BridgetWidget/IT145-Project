class_name EBlueBullet extends "res://EBullet.gd"

var Player = player.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	"res://EBlueBullet.gd"
	"res://EBullet.gd"
"res://EPinkBullet.gd"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# version for blue bullet
func BBoooob(body):
	if is_in_group("enemy_bullet") and body.is_in_group("player") and ((Player.velocity.x != 0) || (Player.velocity.y != 0)):
		body.kill()
	if body != get_parent():
		queue_free()
