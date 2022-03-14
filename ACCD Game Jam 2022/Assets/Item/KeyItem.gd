extends Node2D


signal collected()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
		emit_signal("collected")
