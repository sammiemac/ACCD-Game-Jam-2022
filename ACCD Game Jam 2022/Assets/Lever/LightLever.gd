extends Area2D


# Variable that determines if pressure plate has been pressed or not
var switch = false

# Signals that emit when 'press' is true or false
signal lever_on

func _ready():
	$AnimatedSprite.play("off")


func _on_LightLever_body_entered(_body):
	print("youre in")
	switch = true
	emit_signal("lever_on")
