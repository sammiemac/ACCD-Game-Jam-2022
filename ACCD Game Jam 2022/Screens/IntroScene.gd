extends Control


var scene = 1


# Called when the node enters the scene tree for the first time.
func _ready():
#	$Transition.play("FadeIn")
	$Transition.play("Scene1FadeIn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scene == 1:
		if Input.is_action_just_pressed("continue"):
			$Transition.play("Scene1FadeOut")

	if scene == 2:
		if Input.is_action_just_pressed("continue"):
			$Transition.play("FadeOut")


func _on_Transition_animation_finished(anim_name):
	if anim_name == "Scene1FadeIn":
		$Transition.play("Line2FadeIn")
	if anim_name == "Line2FadeIn":
		$Transition.play("Line3FadeIn")
	if anim_name == "Scene1FadeOut":
		scene = 2
		$BG/Scene2.visible = true
		$Transition.play("Line4FadeIn")
	if anim_name == "Line4FadeIn":
		$Transition.play("Line5FadeIn")
	if anim_name == "Line5FadeIn":
		$Transition.play("Line6FadeIn")
	if anim_name == "FadeOut":
		get_tree().change_scene("res://Levels/TutorialRoom.tscn")


func _on_SFXAmbience_finished():
	$SFXAmbience.play()
