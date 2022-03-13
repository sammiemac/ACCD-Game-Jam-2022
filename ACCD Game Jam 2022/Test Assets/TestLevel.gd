extends Node2D


# Saves the health you had when you entered the room
var starting_health = Global.health
# Sets the player health
var player_health = starting_health


# Detects if the player has taken damage
func _process(delta):
	if player_health == 2:
		$HUD/Health/Heart3/Full.visible = false
	if player_health == 1:
		$HUD/Health/Heart2/Full.visible = false
	# If the player's out of health, play blackout animation
	if player_health == 0:
		$HUD/Health/Heart1/Full.visible = false
		$Player/Light2D.visible = false
		$AnimationPlayer.play("Blackout")

# Check reseting the scene and instances
# Add Kofi tilemap

# Remove one heart every time the player takes damage
func _on_Player_damaged():
	player_health -= 1
	Global.health = player_health


# Once blackout animation is done, reset global_health back to starting_health and reset player_health; restart in main room
func _on_AnimationPlayer_animation_finished(anim_name):
	Global.health = starting_health
	player_health = Global.health
	$AnimationPlayer.stop()
	get_tree().change_scene("res://Test Assets/TestLevel.tscn")
