extends Node2D

onready var light1 = $Lights1
onready var light2 = $Lights2
onready var light3 = $Lights3
onready var light4 = $Lights4
onready var plate = $Plates/PressurePlate/PlateSprite


func _on_PressurePlate_plate_press():
	light1.visible = true
	plate.play("pressed")
	$Timer1.start()


func _on_Timer1_timeout():
	light1.visible = false
	light2.visible = true
	$Timer2.start()


func _on_Timer2_timeout():
	light2.visible = false
	light3.visible = true
	$Timer3.start()


func _on_Timer3_timeout():
	light3.visible = false
	light4.visible = true
	$Timer4.start()


func _on_Timer4_timeout():
	light4.visible = false
	plate.play("default")
