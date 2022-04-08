extends Node2D


signal collected()
export var collectable = true

func _on_body_entered(body):
	if collectable and body.is_in_group("Player"):
		queue_free()
		emit_signal("collected")
