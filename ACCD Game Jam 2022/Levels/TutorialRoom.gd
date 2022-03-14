extends Node2D


func _on_Tunnel_body_entered(body):

	$Tunnel.set_collision_mask_bit(0, false)
	Input.action_release("move_down")
	Input.action_release("move_left")
	Input.action_release("move_right")
	Input.action_release("move_up")
	if body.is_in_group("Player"):
		$SFXTransition.play()


func _on_SFXTransition_finished():
	get_tree().change_scene("res://Levels/DoorRoom.tscn")


func _on_SFXAmbience_finished():
	$SFXAmbience.play()
