extends Node2D

export var LightsRadius = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.lightRadius = LightsRadius

