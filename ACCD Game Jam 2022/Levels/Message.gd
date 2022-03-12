extends CanvasLayer


signal note_clear

func _on_Note_note_collected():
	$Panel.visible = true


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("note_clear")
		queue_free()
