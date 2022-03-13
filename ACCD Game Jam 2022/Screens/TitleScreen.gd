extends Control


func _ready():
	$HowTo.visible = false
	$Credits.visible = false

func _on_play_pressed():
	pass # Replace with function body.


func _on_howto_pressed():
	$HowTo.visible = true


func _on_credits_pressed():
	$Credits.visible = true


func _on_Back_pressed():
	$HowTo.visible = false
	$Credits.visible = false
