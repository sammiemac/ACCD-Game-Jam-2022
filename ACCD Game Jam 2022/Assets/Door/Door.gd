extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func open():
	$SFXOpen.play()
#	set_collision_mask_bit(0, false)
#	visible = false		# door open
#	queue_free()


func _on_SFXOpen_finished():
	queue_free()


func toggle():
	$SFXOpen.play()
	set_collision_mask_bit(0, !get_collision_mask_bit(0))
	set_collision_layer_bit(7, !get_collision_layer_bit(7))
	visible = !visible
