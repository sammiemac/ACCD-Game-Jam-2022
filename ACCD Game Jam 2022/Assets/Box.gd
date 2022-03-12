extends StaticBody2D


onready var ray_right = $RayRight
onready var ray_left = $RayLeft
onready var ray_up = $RayUp
onready var ray_down = $RayDown
enum Direction {UP, DOWN, LEFT, RIGHT}

#func _ready():
#	var tree = get_tree()
#	if tree.has_group("Player"):
#		player = tree.get_nodes_in_group("Player")[0]


#func _on_box_right_body_entered(body):
#	if body.is_in_group("Player"):
#
#		position.x -= 320


func _on_BoxArea_body_entered(body):
	if body.is_in_group("Player"):
		print("in player")
		if body.dir == Direction.UP:
			print("up")
			if ray_up.is_colliding():
				print("ray colliding")
				if ray_up.get_collider().is_in_group("Box") or ray_up.get_collider().is_in_group("Wall"):
					print("not moved")
#					position.y -= 320
				else:
					position.y -= 320
		elif body.dir == Direction.DOWN:
			position.y += 320
		elif body.dir == Direction.LEFT:
			position.x -= 320
		elif body.dir == Direction.RIGHT:
			position.x += 320
#	else:
#
