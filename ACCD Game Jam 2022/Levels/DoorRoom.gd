extends Node2D


var starting_health = Global.health
var player_health = Global.health


# When entering scene, turn off enemy
func _ready():
	$MainEnemy.enemy_on = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_health == 2:
		$HUD/Health/Heart3/Full.visible = false
	if player_health == 1:
		$HUD/Health/Heart2/Full.visible = false
	# If the player's out of health, play blackout animation
	if player_health <= 0:
		$HUD/Health/Heart1/Full.visible = false
		$Player/Light2D.visible = false
		$AnimationPlayer.play("blackout")


# When player passes area, enemy will start chasing
func _on_EnemyStart_body_exited(body):
	if body.is_in_group("Player"):
		$MainEnemy.enemy_on = true


# Remove one heart every time the player takes damage
func _on_Player_damaged():
	player_health -= 1
	Global.health = player_health


# Once blackout animation is done, reset global_health back to starting_health and reset player_health; restart in main room
func _on_AnimationPlayer_animation_finished(anim_name):
	Global.health = starting_health
	player_health = Global.health
	$AnimationPlayer.stop()
#	get_tree().change_scene("res://Levels/MainRoom.tscn)
	get_tree().change_scene("res://Levels/DoorRoom.tscn")

