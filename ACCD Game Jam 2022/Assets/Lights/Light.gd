extends Node2D


#export var turn_on = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if turn_on:
#		$Light2D.visible = true
#		$Timer.start()
#	elif not turn_on:
#		$Light2D.visible = false


func turn_on():
	$Light2D.visible = true
	$Timer.start()


func _on_Timer_timeout():
	$Light2D.visible = false