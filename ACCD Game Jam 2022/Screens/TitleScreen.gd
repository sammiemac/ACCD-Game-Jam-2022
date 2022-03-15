extends Control


func _ready():
	$HowTo.visible = false
	$Credits.visible = false

func _on_play_pressed():
	$SFXAccept.play()
	$Transition.play("FadeOut")


func _on_howto_pressed():
	$SFXAccept.play()
	$HowTo.visible = true


func _on_credits_pressed():
	$SFXAccept.play()
	$Credits.visible = true


func _on_Back_pressed():
	$HowTo.visible = false
	$Credits.visible = false


func _on_mouse_entered():
	$SFXSelect.play()


func _on_Transition_animation_finished(anim_name):
	get_tree().change_scene("res://Screens/IntroScene.tscn")
