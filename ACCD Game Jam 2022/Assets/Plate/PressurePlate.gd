extends Area2D


# Variable that determines if pressure plate has been pressed or not
var press = false

# Signals that emit when 'press' is true or false
signal plate_press
signal plate_unpress


# If a body (such as the player or a box) enters the pressure plate area
func _on_PressurePlate_body_entered(body):
	press = true
	emit_signal("plate_press")

# If a body (such as the player or a box) exits the pressure plate area
func _on_PressurePlate_body_exited(body):
	press = false
	emit_signal("plate_unpress")
