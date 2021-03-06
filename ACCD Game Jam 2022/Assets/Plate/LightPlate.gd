extends Area2D

export var out = 0

# Variable that determines if pressure plate has been pressed or not
#var press = false

# Signals that emit when 'press' is true or false
signal plate_press(num)
signal plate_unpress(num)


func _ready():
	$PlateSprite.play("default")

# Presses iff the body is a player and enters the area
func _on_PressurePlate_body_entered(body):
	if body.is_in_group("Player"):
		$SFXPress.play()
		$PlateSprite.play("pressed")
#		press = true
		emit_signal("plate_press", out)

# Unresses iff the body is a player and exits the area
func _on_PressurePlate_body_exited(body):
	if body.is_in_group("Player"):
		$PlateSprite.play("default")
#		press = false
		emit_signal("plate_unpress", out)
