extends Node2D

onready var light1 = $Light1
onready var light2 = $Light2


func _on_PressurePlate_plate_press():
	light1.visible = true
	light2.visible = true
	
	$Timer.start()


func _on_Timer_timeout():
	light1.visible = false
	light2.visible = false
