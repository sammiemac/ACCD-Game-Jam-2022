extends Node2D


var going_up = true
export var rotate_speed = 100
export var pointA = 0
export var pointB = 0

onready var pointer = $Pointer
onready var ray = $Pointer/Ray
#onready var tree = get_tree()
#onready var player = tree.get_node("Player")


func _process(delta):
	if pointA != pointB:
		if pointer.rotation_degrees >= pointB:
			going_up = false
		elif pointer.rotation_degrees <= pointA:
			going_up = true
	
	if going_up:
		pointer.rotation_degrees += rotate_speed * delta
	elif not going_up:
		pointer.rotation_degrees -= rotate_speed * delta
	
	if ray.is_colliding():
		is_seen()
		

func is_seen():
	if ray.get_collider().is_in_group("Player"):
		print("seen player")
		ray.get_collider().damage(true)
		$SFXDetect.play()
#		emit_signal("seen")
#		pointer.rotation_degrees = get_angle_to(target)
#		look_at(target)
#	else:
#		emit_signal("not_seen")
#		pointer.rotation_degrees += rotate_speed * delta
