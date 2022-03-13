extends Area2D


# Variable that determines if pressure plate has been pressed or not
#var press = false

# Signals that emit when 'press' is true or false
signal button_press
signal button_unpress


func _ready():
	$BASSprite.play("default")

# Presses iff the body is a box and enters the area
func _on_Button_body_entered(body):
	if body.is_in_group("Box"):
		$BASSprite.play("pressed")
#		press = true
		emit_signal("button_press")

# Unpresses iff the body is a box and exits the area
func _on_Button_body_exited(body):
	if body.is_in_group("Box"):
		$BASSprite.play("default")
#		press = false
		emit_signal("button_unpress")
