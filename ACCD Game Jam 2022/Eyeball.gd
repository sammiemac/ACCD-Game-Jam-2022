extends Node2D


export var rotate_speed = 100

onready var pointer = $Pointer
onready var ray = $Pointer/Ray
onready var player = TestLevel.get_node("Player")
var target


func _process(delta):
	target = player.global_position
	if ray.is_colliding():
		is_seen(target, delta)
	else:
		pointer.rotation_degrees += rotate_speed * delta

func is_seen(target, delta):
	if ray.get_collider().is_in_group("Player"):
		print("seen by 1")
#		emit_signal("seen")
		pointer.rotation_degrees = get_angle_to(target)
		look_at(target)
	else:
#		emit_signal("not_seen")
		pointer.rotation_degrees += rotate_speed * delta
