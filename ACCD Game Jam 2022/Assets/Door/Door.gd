extends StaticBody2D

export var TimeWait = 1
var open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = TimeWait

func door_move():
	set_collision_mask_bit(0, !get_collision_mask_bit(0))
	set_collision_layer_bit(7, !get_collision_layer_bit(7))
	visible = !visible

func open():
	if not open:
		open = true
		$SFXOpen.play()
		$Timer.start()

#
#func _on_SFXOpen_finished():
#	queue_free()


func toggle():
	open = !open
	$SFXOpen.play()
	$Timer.start()


func _on_Timer_timeout():
	door_move()
