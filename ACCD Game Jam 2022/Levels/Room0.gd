extends Node2D

var lights = false

func _process(_delta):
	if lights:
		if Input.is_action_just_pressed("ui_accept") and $LightLever.switch:
			print("click")
			$LightsOff.visible = false
			$LightLever/AnimatedSprite.play("on")
			$LightLever/Light2D.energy = 1
#			$LightsOn.visible = true
			$Player/Light2D.visible = false

func _on_LightLever_lever_on():
	print("gello")
	lights = true
#	if Input.is_action_just_pressed("ui_accept") and $LightLever.switch:
#		print("click")
#		$CanvasModulate.visible = false
