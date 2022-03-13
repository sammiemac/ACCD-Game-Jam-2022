extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():		
		child.connect("plate_press", self, "lights_handler")
#		child.connect("button_press", self, "lights_on")

func lights_handler(var num):
	var lightNode = get_parent().get_node("Lights")
	
	match num:
		1:
			lightNode.get_node("Light6").turn_on()
		2:
			lightNode.get_node("Light8").turn_on()
		3:
			lightNode.get_node("Light9").turn_on()
		4:
			lightNode.get_node("Light").turn_on()
			lightNode.get_node("Light11").turn_on()
		5:
			lightNode.get_node("Light2").turn_on()
			lightNode.get_node("Light3").turn_on()
			lightNode.get_node("Light4").turn_on()
		6:
			lightNode.get_node("Light13").turn_on()
		7:
			lightNode.get_node("Light10").turn_on()
#		_:
#			for child in lightNode.get_children(): 
#				child.perm_on()
				
func lights_on():
	var lightNode = get_parent().get_node("Lights")
	for child in lightNode.get_children(): 
		child.perm_on()
