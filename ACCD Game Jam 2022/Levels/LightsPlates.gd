extends Node2D

onready var light11 = $Lights1/Light11
onready var light12 = $Lights1/Light12
onready var light21 = $Lights2/Light21
onready var light22 = $Lights2/Light22
onready var light31 = $Lights3/Light31
onready var light32 = $Lights3/Light32
onready var light41 = $Lights4/Light41
onready var light42 = $Lights4/Light42
onready var plate = $Plates/PressurePlate/PlateSprite


func _on_PressurePlate_plate_press():
	light11.turn_on()
	light12.turn_on()
	plate.play("pressed")
	$Timer1.start()


func _on_Timer1_timeout():
#	light11.visible = false
#	light12.visible = false
	light21.turn_on()
	light22.turn_on()
	$Timer2.start()


func _on_Timer2_timeout():
#	light21.visible = false
#	light22.visible = false
	light31.turn_on()
	light32.turn_on()
	$Timer3.start()


func _on_Timer3_timeout():
#	light31.visible = false
#	light32.visible = false
	light41.turn_on()
	light42.turn_on()
	$Timer4.start()


func _on_Timer4_timeout():
#	light41.visible = false
#	light42.visible = false
	plate.play("default")
