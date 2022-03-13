extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func open():
	set_collision_mask_bit(0, false)
	visible = false		# door open
