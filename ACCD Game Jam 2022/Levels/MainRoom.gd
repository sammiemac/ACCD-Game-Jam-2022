extends Node2D




func _ready():
	$KeyItems/BodySuit.visible = false
	$KeyItems/AirTank.visible = false
	$KeyItems/Helmet.visible = false
	
	if Global.levels_completed[0]:
		$BodySuit.visible = true
		
	if Global.levels_completed[2]:
		$AirTank.visible = true

	if Global.levels_completed[1]:
		$Helmet.visible = false
	
	# TODO: Third room door logic
	
	$Player.position.x = 4800
	$Player.position.y = 8238
	
	if Global.location == Global.Locations.DoorR:
		$Player.position.x = 1944
		$Player.position.y = 4856
	elif Global.location == Global.Locations.BoxR:
		$Player.position.x = 7848
		$Player.position.y = 4824
	elif Global.location == Global.Locations.SpikeR:
		$Player.position.x = 4792
		$Player.position.y = 1160

func _on_Note_note_collected():
	$SFXNote.play()
	$AnimationPlayer.play("transition")


func _on_SFXAmbience_finished():
	$SFXAmbience.play()


func _on_Music_finished():
	$Music.play()


func _on_SFXNote_finished():
	get_tree().change_scene("res://Screens/End.tscn")
