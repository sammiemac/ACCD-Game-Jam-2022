extends Node2D


func _ready():
	if Global.levels_completed == 0:
		$BodySuit.visible = false
		$AirTank.visible = false
		$Helmet.visible = false
	
	if Global.levels_completed == 1:
		$BodySuit.visible = true
		$AirTank.visible = false
		$Helmet.visible = false
		
	if Global.levels_completed == 2:
		$BodySuit.visible = true
		$AirTank.visible = true
		$Helmet.visible = false
		
	if Global.levels_completed == 3:
		$BodySuit.visible = true
		$AirTank.visible = true
		$Helmet.visible = true
