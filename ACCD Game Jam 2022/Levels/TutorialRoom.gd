extends Node2D



func _on_Tunnel_body_entered(body):
	$Timer.start()



func _on_Timer_timeout():
	get_tree().change_scene("res://Levels/MainRoom.tscn")
