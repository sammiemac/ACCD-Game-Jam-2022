extends Node2D


#export var turn_on = false
export var LightRadius = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if turn_on:
#		$Light2D.visible = true
#		$Timer.start()
#	elif not turn_on:
#		$Light2D.visible = false
func _ready():
	$Light2D.texture_scale = LightRadius

func turn_on():
	$Light2D.visible = true
	$Timer.start()


func _on_Timer_timeout():
	$Light2D.visible = false

func perm_on():
	$Light2D.visible = true
