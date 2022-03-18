extends Node2D

signal message_read()

func _ready():
	$Transition.play("FadeIn")

func _process(delta):
	if Input.is_action_pressed("continue") and $Message/NoteBG.visible:
		$Message/NoteBG.visible = false
		$Player.freeze = false
		emit_signal("message_read")	#queue_pop
	

func _on_Tunnel_body_entered(body):
	if body.is_in_group("Player"):
		$Tunnel.set_collision_mask_bit(0, false)
		Input.action_release("move_down")
		Input.action_release("move_left")
		Input.action_release("move_right")
		Input.action_release("move_up")

		$SFXTransition.play()
		$Transition.play("FadeOut")


func _on_SFXTransition_finished():
	get_tree().change_scene("res://Levels/DoorRoom.tscn")


func _on_SFXAmbience_finished():
	$SFXAmbience.play()


func _on_Note_note_collected():
	$Message/NoteBG.visible = true
	$Player.freeze = true
