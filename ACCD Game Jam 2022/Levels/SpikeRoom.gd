extends Node2D


var starting_health = Global.health
var player_health = starting_health

func _ready():
	player_health = starting_health
	Global.location = Global.Locations.SpikeR
	$LightsOff.visible = true

func _process(delta):
	if player_health <= 2:
		$HUD/Health/Heart3/Full.visible = false
	if player_health <= 1:
		$HUD/Health/Heart2/Full.visible = false
	# If the player's out of health, play blackout animation
	if player_health <= 0:
		$HUD/Health/Heart1/Full.visible = false
		Global.health = starting_health
		player_health = Global.health
		get_tree().change_scene("res://Levels/SpikeRoom.tscn")


func _on_SFXAmbience_finished():
	$SFXAmbience.play()


func _on_Music_finished():
	$Music.play()


# Remove one heart every time the player takes damage
func _on_Player_damaged():
	player_health -= 1
	Global.health = player_health


func _on_Helmet_collected():
	$Enemies/MainEnemy.queue_free()
#	Global.levels_completed += 1
	$SFXTransition.play()


func _on_SFXTransition_finished():
	get_tree().change_scene("res://Levels/MainRoom.tscn")


func _on_Entrance_body_entered(body):
	Input.action_release("move_down")
	Input.action_release("move_left")
	Input.action_release("move_right")
	Input.action_release("move_up")
	$SFXTransition2.play()


func _on_SFXTransition2_finished():
	get_tree().change_scene("res://Levels/MainRoom.tscn")
