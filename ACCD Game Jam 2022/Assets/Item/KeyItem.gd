extends Node2D


signal collected()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("collected")
