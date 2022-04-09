extends Node2D

var starting_health = Global.health
var player_health

# When entering scene, turn off enemy
func _ready():
	player_health = starting_health
	Global.location = Global.Locations.DoorR
	$MainEnemy.enemy_on = false
	$LightsOff.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
		get_tree().change_scene("res://Levels/DoorRoom.tscn")


# When player passes area, enemy will start chasing
func _on_EnemyStart_body_exited(body):
	if body.is_in_group("Player"):
		$MainEnemy.enemy_on = true


# Remove one heart every time the player takes damage
func _on_Player_damaged():
	player_health -= 1
	Global.health = player_health


## Once blackout animation is done, reset global_health back to starting_health and reset player_health; restart in main room
#func _on_AnimationPlayer_animation_finished(anim_name):
#	Global.health = starting_health
#	player_health = Global.health
#	$AnimationPlayer.stop()
##	get_tree().change_scene("res://Levels/MainRoom.tscn)
#	get_tree().change_scene("res://Levels/DoorRoom.tscn")



func _on_BodySuit_collected():
	$MainEnemy.queue_free()
	
#	Global.levels_completed += 1
	$SFXTransition.play()


func _on_SFXTransition_finished():
	get_tree().change_scene("res://Levels/MainRoom.tscn")


#func _on_Timer_timeout():
#	Global.health = starting_health
#	player_health = Global.health
#	get_tree().change_scene("res://Levels/DoorRoom.tscn")


func _on_SFXAmbience_finished():
	$SFXAmbience.play()


func _on_Music_finished():
	$Music.play()


func _on_Entrance_body_entered(body):
	Input.action_release("move_down")
	Input.action_release("move_left")
	Input.action_release("move_right")
	Input.action_release("move_up")
	$SFXTransition2.play()


func _on_SFXTransition2_finished():
	get_tree().change_scene("res://Levels/MainRoom.tscn")
