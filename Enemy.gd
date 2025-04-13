extends CharacterBody2D

var speed = 60

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = false

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
		
	velocity.x = speed
	move_and_slide()
func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed) * -1
	else:
		speed = abs(speed)


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("tile"):
		flip()
