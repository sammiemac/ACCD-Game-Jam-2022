extends Area2D


signal note_collected


func _on_Note_body_entered(body):
	emit_signal("note_collected")


func _on_Message_note_clear():
	queue_free()
