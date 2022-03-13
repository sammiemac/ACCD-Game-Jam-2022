extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func open():
#	$CollisionShape2D.disabled = true
#	visible = false		# door open
	queue_free()
