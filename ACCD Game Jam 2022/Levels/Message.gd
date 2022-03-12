extends CanvasLayer


var note_collect = false

signal note_clear

func _on_Note_note_collected():
	$Panel.visible = true
	note_collect = true

func _process(_delta):
	if note_collect:
		if Input.is_action_just_pressed("ui_accept"):
			emit_signal("note_clear")
			queue_free()
