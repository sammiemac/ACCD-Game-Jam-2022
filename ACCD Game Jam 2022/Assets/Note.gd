extends Area2D


signal note_collected


func _on_Note_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("note_collected")


func _on_Message_note_clear():
	queue_free()
